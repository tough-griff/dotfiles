# USB selective suspend and PCIe link state power management are common causes
# of USB devices not coming back after sleep. AC only, so laptops keep their
# battery savings.
gsudo {
    $usbSettings = '2a737441-1930-4402-8d77-b2bebba308a3'
    $usbSelectiveSuspend = '48e6b7a6-50f5-4782-a5d4-53bb8f07e226'
    powercfg /setacvalueindex SCHEME_CURRENT $usbSettings $usbSelectiveSuspend 0
    powercfg /setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0
    powercfg /setactive SCHEME_CURRENT
}

# The per-device "Allow the computer to turn off this device to save power"
# checkbox is separate from selective suspend. MSPower_DeviceEnable is the
# documented way to clear it, but WMI fails to enumerate that class on some
# machines, so write the WDF value the checkbox stores. Takes effect after a
# reboot.
$rootHubs = Get-PnpDevice -Class USB -PresentOnly | Where-Object FriendlyName -like '*Root Hub*'
"Disabling power-off for $(@($rootHubs).Count) USB root hubs"
gsudo {
    foreach ($id in $args) {
        $wdf = "HKLM:\SYSTEM\CurrentControlSet\Enum\$id\Device Parameters\WDF"
        if (Test-Path $wdf) {
            Set-ItemProperty -Path $wdf -Name IdleInWorkingState -Value 0
        }
    }
} -args $rootHubs.InstanceId

$adapters = Get-NetAdapter -Physical | Sort-Object InterfaceDescription -Unique

# Wi-Fi adapters wake the machine spuriously and can't wake it from shutdown.
foreach ($wifi in $adapters | Where-Object PhysicalMediaType -eq 'Native 802.11') {
    "Disabling wake for $($wifi.InterfaceDescription)"
    gsudo { powercfg /devicedisablewake $args[0] } -args $wifi.InterfaceDescription
}

# Wake-on-LAN on magic packets only: pattern match wakes on ordinary network
# traffic. EEE and Realtek's Green Ethernet and Power Saving Mode cause link
# drops after wake. Keywords a driver doesn't have are skipped.
foreach ($ethernet in $adapters | Where-Object PhysicalMediaType -eq '802.3') {
    "Configuring Wake-on-LAN and power saving for $($ethernet.InterfaceDescription)"
    gsudo {
        powercfg /deviceenablewake $args[1]
        $properties = @{
            '*WakeOnMagicPacket'  = 1
            'S5WakeOnLan'         = 1
            '*WakeOnPattern'      = 0
            '*EEE'                = 0
            'EnableGreenEthernet' = 0
            'PowerSavingMode'     = 0
        }
        foreach ($keyword in $properties.Keys) {
            if (Get-NetAdapterAdvancedProperty -Name $args[0] -RegistryKeyword $keyword -ErrorAction SilentlyContinue) {
                Set-NetAdapterAdvancedProperty -Name $args[0] -RegistryKeyword $keyword -RegistryValue $properties[$keyword]
            }
        }
    } -args $ethernet.Name, $ethernet.InterfaceDescription
}

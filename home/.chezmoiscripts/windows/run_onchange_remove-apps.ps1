# To run this script:
# 1. Run Windows PowerShell as Administrator
# 2. Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# 3. Run `chezmoi apply ~/.chezmoiscripts/windows/remove-apps.ps1`

$Junk = "549981C3F5F10|Clipchamp|Copilot|Bing|GetHelp|NarratorScript|MicrosoftOfficeHub|MicrosoftSolitaireCollection|MicrosoftStickyNotes|OneDrive|Todos|DevHome|People|Photos|WindowsAlarms|WindowsCalculator|WindowsCamera|WindowsCommunicationsApps|WindowsFeedbackHub|WindowsMaps|YourPhone|Zune|MSTeams|QuickAssist|CrossDevice"

Get-AppxPackage | Where-Object { $_.Name -match $Junk -and $_.NonRemovable -eq $false } | ForEach-Object {
    "Removing {0}" -f $_.Name
    Remove-AppxPackage $_
}

Get-AppxPackage -AllUsers | Where-Object { $_.Name -match $Junk -and $_.NonRemovable -eq $false } | ForEach-Object {
    "Removing {0} for all users" -f $_.Name
    Remove-AppxPackage -AllUsers $_
}

Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -match $Junk } | ForEach-Object {
    "Removing provisioned app {0}" -f $_.DisplayName
    Remove-AppxProvisionedPackage -Online -AllUsers $_
}

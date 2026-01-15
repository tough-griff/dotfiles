# To run this script:
# 1. Run Windows PowerShell as Administrator
# 2. Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# 3. Run `chezmoi apply ~/.chezmoiscripts/windows/remove-apps.ps1`

# $Junk = "549981C3F5F10|Clipchamp|Copilot|Bing|NarratorScript|MicrosoftOfficeHub|MicrosoftSolitaireCollection|MicrosoftStickyNotes|OneDrive|Todos|DevHome|People|WindowsAlarms|WindowsCamera|WindowsCommunicationsApps|WindowsFeedbackHub|WindowsMaps|Zune|MSTeams|QuickAssist"
$Junk = "Clipchamp" # Temporarily disabling the removal of most of these.

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

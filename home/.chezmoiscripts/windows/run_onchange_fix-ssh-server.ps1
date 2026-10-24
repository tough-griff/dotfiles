# Fixes two common causes of inbound SSH failing on Windows OpenSSH Server:
# - missing firewall allow rule for sshd
if (-Not (Get-NetFirewallRule -Name sshd -ErrorAction SilentlyContinue)) {
    "Creating firewall rule for sshd"
    gsudo { New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH SSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22 }
} else {
    "Firewall rule for sshd already exists"
}

# - loose ACL on administrators_authorized_keys (required instead of
#   ~/.ssh/authorized_keys when the connecting user is a local Administrator)
$administratorsAuthorizedKeys = "$env:ProgramData\ssh\administrators_authorized_keys"
if (Test-Path $administratorsAuthorizedKeys) {
    "Locking down ACL on $administratorsAuthorizedKeys"
    gsudo { icacls $args[0] /inheritance:r } -args $administratorsAuthorizedKeys
    gsudo { icacls $args[0] /grant:r "SYSTEM:F" "Administrators:F" } -args $administratorsAuthorizedKeys
} else {
    "$administratorsAuthorizedKeys does not exist, skipping ACL fix"
}

# Use the app execution alias: the MSIX install path includes the version and
# changes on every update.
$pwsh = "$env:LOCALAPPDATA\Microsoft\WindowsApps\pwsh.exe"
"Setting sshd DefaultShell to $pwsh"
gsudo { New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH' -Name DefaultShell -Value $args[0] -PropertyType String -Force | Out-Null } -args $pwsh

gsudo { Set-Service sshd -StartupType Automatic }
gsudo { Start-Service sshd }

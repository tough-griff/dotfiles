# To run this script:
# 1. Run Windows PowerShell as Administrator
# 2. Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# 3. Run `chezmoi apply ~/.chezmoiscripts/windows/fix-ssh-server.ps1`
#
# Fixes two common causes of inbound SSH failing on Windows OpenSSH Server:
# - missing firewall allow rule for sshd
# - loose ACL on administrators_authorized_keys (required instead of
#   ~/.ssh/authorized_keys when the connecting user is a local Administrator)

if (-not (Get-NetFirewallRule -Name sshd -ErrorAction SilentlyContinue)) {
    "Creating firewall rule for sshd"
    New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH SSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    "Firewall rule for sshd already exists"
}

$AdminKeys = "C:\ProgramData\ssh\administrators_authorized_keys"
if (Test-Path $AdminKeys) {
    "Locking down ACL on $AdminKeys"
    icacls $AdminKeys /inheritance:r
    icacls $AdminKeys /grant:r "SYSTEM:F" "Administrators:F"
} else {
    "$AdminKeys does not exist, skipping ACL fix"
}

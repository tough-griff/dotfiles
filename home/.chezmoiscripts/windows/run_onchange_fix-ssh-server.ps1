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
if (Test-Path "C:\ProgramData\ssh\administrators_authorized_keys") {
    "Locking down ACL on C:\ProgramData\ssh\administrators_authorized_keys"
    gsudo { icacls "C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r }
    gsudo { icacls "C:\ProgramData\ssh\administrators_authorized_keys" /grant:r "SYSTEM:F" "Administrators:F" }
} else {
    "C:\ProgramData\ssh\administrators_authorized_keys does not exist, skipping ACL fix"
}

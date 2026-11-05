# Developer Mode lets chezmoi create symlinks without elevation. gsudo isn't
# installed yet on a fresh machine, so elevate with a plain UAC prompt.
$ErrorActionPreference = 'Stop'
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock'
if ((Get-ItemProperty $key -ErrorAction SilentlyContinue).AllowDevelopmentWithoutDevLicense -ne 1) {
    "Enabling Developer Mode so chezmoi can create symlinks"
    Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile', '-Command',
        "New-ItemProperty -Path '$key' -Name AllowDevelopmentWithoutDevLicense -Value 1 -PropertyType DWord -Force"
}

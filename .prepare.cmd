@echo off
rem install chocolatey if it's missing, so it's available alongside winget
where choco >nul 2>nul
if errorlevel 1 (
    echo Installing Chocolatey...
    powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
)

rem exit immediately if op is already in %PATH%
where op >nul 2>nul && exit /b 0

rem winget requires the App Installer package; it's preinstalled on most
rem Windows 10/11 systems but can be missing on stripped-down images
where winget >nul 2>nul
if errorlevel 1 (
    echo Could not find winget on this system.
    echo Install "App Installer" from the Microsoft Store, then re-run this script:
    echo https://apps.microsoft.com/detail/9nblggh4nns1
    exit /b 1
)

winget install --exact --id AgileBits.1Password.CLI

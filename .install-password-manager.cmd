@echo off
rem exit immediately if op is already in %PATH%
where op >nul 2>nul && exit /b 0

winget install --exact --id AgileBits.1Password.CLI

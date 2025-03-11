# TODO: Automate?
# Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# Run `chezmoi apply ~/.chezmoiscripts/windows/remove-bloat.ps1`

$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Fonts\*.ttf" | ForEach-Object { $fonts.CopyHere($_.FullName) }

Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Invoke-Expression (&starship init powershell)

Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"

New-Alias -Name chez -Value "chezmoi"

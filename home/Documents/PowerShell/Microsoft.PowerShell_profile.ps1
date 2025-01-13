Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Invoke-Expression (&starship init powershell)

Import-Module -Name Microsoft.WinGet.CommandNotFound

New-Alias -Name chez -Value "chezmoi"

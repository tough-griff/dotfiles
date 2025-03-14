Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

function Invoke-Starship-TransientFunction {
  &starship module character
}
Invoke-Expression (&starship init powershell)
Enable-TransientPrompt

Import-Module -Name Microsoft.WinGet.CommandNotFound

New-Alias -Name c -Value "clear"
New-Alias -Name chez -Value "chezmoi"
New-Alias -Name g -Value "git"

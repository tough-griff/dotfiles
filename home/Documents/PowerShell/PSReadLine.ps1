Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit

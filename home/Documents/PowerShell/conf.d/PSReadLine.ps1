# Non-interactive sessions (e.g. `ssh host 'cmd'`) have no console for
# PSReadLine, and -PredictionSource errors there.
if ([Console]::IsOutputRedirected) { return }

Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit

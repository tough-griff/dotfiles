# Non-interactive sessions (e.g. `ssh host 'cmd'`) have no console for
# PSReadLine, and -PredictionSource errors there.
if ([Console]::IsOutputRedirected) { return }

Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# Mirrors fish_color_* in run_onchange_after_configure-fish.fish.tmpl. ANSI
# palette indexes (not RGB) so colors follow the terminal theme like fish's.
Set-PSReadLineOption -Colors @{
    Command          = "`e[32m"
    Keyword          = "`e[32m"
    String           = "`e[33m"
    Comment          = "`e[90m"
    InlinePrediction = "`e[90m"
    Operator         = "`e[36m"
    Variable         = "`e[36m"
    Error            = "`e[31m"
    Emphasis         = "`e[100m"
    Parameter        = "`e[39m"
    Number           = "`e[39m"
    Member           = "`e[39m"
    Type             = "`e[39m"
}
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit

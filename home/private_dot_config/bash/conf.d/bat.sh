# shellcheck shell=bash
command -v bat >/dev/null 2>&1 || return

export BAT_THEME_DARK="One Dark Pro"
export BAT_THEME_LIGHT="One Light Pro"
alias cat=bat

# shellcheck shell=bash
command -v duf >/dev/null 2>&1 || return

alias df=duf

#!/usr/bin/env fish

if not test -f ~/.config/fish/functions/fisher.fish
    echo "installing fisherman"
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fisher
end

set -U fish_color_autosuggestion brblack
set -U fish_color_cancel red
set -U fish_color_command green
set -U fish_color_comment brblack
set -U fish_color_cwd cyan
set -U fish_color_end magenta
set -U fish_color_error red
set -U fish_color_escape cyan
set -U fish_color_history_current white
set -U fish_color_host white
set -U fish_color_match green
set -U fish_color_normal white
set -U fish_color_operator cyan
set -U fish_color_param white
set -U fish_color_quote yellow
set -U fish_color_redirection magenta
set -U fish_color_search_match --background brblack
set -U fish_color_selection white
set -U fish_color_user white
set -U fish_color_valid_path --underline

set -U fish_pager_color_description yellow
set -U fish_pager_color_prefix white
set -U fish_pager_color_progress brblack

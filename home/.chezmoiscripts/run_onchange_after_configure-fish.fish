#!/usr/bin/env fish

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
set -U fish_pager_color_prefix green
set -U fish_pager_color_progress brblack

set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_STATE_HOME "$HOME/.local/state"
set -Ux XDG_CACHE_HOME "$HOME/.cache"

# install fisher packages
curl -fsSL https://git.io/fisher | source
fisher install jorgebucaran/fisher
fisher install franciscolourenco/done
fisher install jethrokuan/z
fisher install jorgebucaran/autopair.fish
fisher install jorgebucaran/replay.fish
fisher install tough-griff/smartdot.fish

# setup completions
set -l completions "$HOME/.config/fish/completions"
mkdir -p "$completions"
if command -sq chezmoi
    chezmoi completion fish >"$completions/chezmoi.fish"
end

if command -sq docker
    docker completion fish >"$completions/docker.fish"
end

if command -sq op
    op completion fish >"$completions/op.fish"
end

if command -sq rustup
    rustup completions fish >"$completions/rustup.fish"
end

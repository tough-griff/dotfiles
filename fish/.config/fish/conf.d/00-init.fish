if not status is-login || test -n "$___fish_init___" -a "$___fish_init___" -ge 2000
    exit
end

set -U ___fish_init___ 2000

set -Ux BREW_PREFIX (brew --prefix)
set -Ux DOTDIR (cd (dirname (realpath (status current-filename)))/../../../.. && pwd)
set -Ux LANG "en_US.UTF-8"
set -Ux LC_ALL "en_US.UTF-8"

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

fish_add_path "$BREW_PREFIX/opt/grep/libexec/gnubin"
fish_add_path "$BREW_PREFIX/opt/gnu-tar/libexec/gnubin"
fish_add_path "$BREW_PREFIX/opt/gnu-sed/libexec/gnubin"
fish_add_path "$BREW_PREFIX/opt/findutils/libexec/gnubin"
fish_add_path "$BREW_PREFIX/opt/coreutils/libexec/gnubin"

if test ! -f ~/.config/fish/functions/fisher.fish
    echo "installing fisherman"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end
fish -c "fisher update"

cd "$DOTDIR" && stow -R fish

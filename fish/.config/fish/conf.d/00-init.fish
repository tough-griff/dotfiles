status is-login || exit

set -gx OS "$(uname -s)"
set -gx ARCH "$(uname -m)"

set -gx DOTDIR "$(path resolve $(status filename)/../../../../..)"
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

if test "$OS" = Darwin
    set -gx CPU_BRAND "$(sysctl -n machdep.cpu.brand_string)"

    if test -x /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else if test -x /usr/local/bin/brew
        eval "$(/usr/local/bin/brew shellenv)"
    end
else
    if test -x /home/linuxbrew/.linuxbrew/bin/brew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else if test -x "$HOME/.linuxbrew/bin/brew"
        eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
    end
end

set -q __fish_initialized_me || set -U __fish_initialized_me 0

if test "$__fish_initialized_me" -lt 1006
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

    if not test -f "$HOME/.config/fish/functions/fisher.fish"
        echo "installing fisherman"
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    end
    fisher install franciscolourenco/done
    fisher install jethrokuan/z
    fisher install jorgebucaran/autopair.fish
    fisher install jorgebucaran/replay.fish
    fisher install tough-griff/smartdot.fish

    stow -t "$HOME" -d "$DOTDIR" -R fish
end

set -U __fish_initialized_me 1006

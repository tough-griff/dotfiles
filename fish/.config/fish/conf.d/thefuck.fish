command -q thefuck || exit

set -l fuckfunction "$__fish_config_dir/functions/fuck.fish"
test -f "$fuckfunction" || thefuck --alias > $fuckfunction

set -gx THEFUCK_OVERRIDDEN_ALIASES 'bat,git'

status is-login || exit

if not set -q ___fish_init___ || test $___fish_init___ -lt 1010
    $__fish_config_dir/init.fish
end

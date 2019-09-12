set -l _smartdot_bind_mode default
switch $fish_key_bindings
    case 'fish_vi_key_bindings' 'fish_hybrid_key_bindings'
        set _smartdot_bind_mode insert
end

bind -M $_smartdot_bind_mode '.' _smartdot

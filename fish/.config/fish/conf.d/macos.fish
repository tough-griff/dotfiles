test "$OS" = Darwin || exit

# M1 specific behavior:
if string match -rq M1 "$CPU_BRAND"
    if test "$(uname -m )" != arm64
        set -gx ARCH "$(uname -m)"

        set -gx NODENV_VERSION "14-$ARCH"
    end
end

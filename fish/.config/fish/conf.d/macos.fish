test "$(uname -s)" = "Darwin" || exit

if test "$(uname -m )" != "arm64"
    set -gx ARCH "$(uname -m)"
end

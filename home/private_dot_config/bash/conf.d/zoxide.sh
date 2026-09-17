command -v zoxide >/dev/null 2>&1 || return

eval "$(zoxide init bash)"

# zoxide 0.10.0's generated __zoxide_pwd is missing a command substitution on
# MSYS/Git Bash, passing the literal string "\builtin pwd -L" to cygpath -w
# instead of its output. Remove this once upstream ships the fix:
# https://github.com/ajeetdsouza/zoxide/pull/1260
function __zoxide_pwd() {
	\command cygpath -w "$(\builtin pwd -L)"
}

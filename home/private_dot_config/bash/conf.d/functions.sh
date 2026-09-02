mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Evaluate a command in each subdirectory
each() {
  local dir
  for dir in */; do
    dir=${dir%/}
    printf '\033[1;34m%s:\033[0m\n' "$dir"
    ( cd "$dir" && eval "$*" )
    echo
  done
}

# Open a directory in VS Code, defaulting to the current one
edit() {
  local args=("$@")
  if [ "$#" -eq 0 ] || [ ! -e "${!#}" ]; then
    args+=(".")
  fi
  code "${args[@]}"
}

# Open files or directories with the platform default handler
open() {
  local target=${1:-.}
  case "$OSTYPE" in
    darwin*) command open "$@" ;;
    msys* | cygwin*) start "" "$target" ;;
    *) xdg-open "$target" >/dev/null 2>&1 & ;;
  esac
}

psg() {
  ps aux | grep "$@" | grep -v grep
}

gen-secret() {
  node -p "require('crypto').randomBytes(${1:-64}).toString('base64');"
}

splitpath() {
  printf '%s\n' "$PATH" | tr ':' '\n'
}

ipv4() {
  curl -s api4.ipify.org
}

ipv6() {
  curl -s api6.ipify.org
}

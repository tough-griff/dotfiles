if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
fi

if command -v npm >/dev/null 2>&1; then
  alias npmi='npm install'
  alias npml='npm ls'
  alias rrepl='env NODE_REPL_MODE=strict npx rrepl'

  for _v in 6 7 8 9 10; do
    alias "npm${_v}=corepack npm@${_v}"
  done
  unset _v
fi

if command -v bun >/dev/null 2>&1; then
  _bun_bin=$(bun pm bin --global 2>/dev/null)
  case ":${PATH}:" in
    *":${_bun_bin}:"*) ;;
    *) [ -n "${_bun_bin}" ] && PATH="${_bun_bin}:${PATH}" ;;
  esac
  unset _bun_bin
fi

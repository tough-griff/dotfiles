export RUSTUP_HOME="${HOME}/.rustup"
export CARGO_HOME="${HOME}/.cargo"

[ -x "${CARGO_HOME}/bin/rustup" ] || return

case ":${PATH}:" in
  *":${CARGO_HOME}/bin:"*) ;;
  *) PATH="${CARGO_HOME}/bin:${PATH}" ;;
esac

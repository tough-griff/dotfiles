# Implements the `hub` enhancements to `git`
if test $(which hub); then
  eval "$(hub alias -s)"
fi

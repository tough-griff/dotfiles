function _osx_get_frontmost_app {
  local the_app=$(
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell
EOF
  )
  echo "${the_app}"
}

function tab {
  # Must not have trailing semicolon, for iTerm compatibility
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_osx_get_frontmost_app)

  if [[ "${the_app}" == 'Terminal' ]]; then
    # Discarding stdout to quash "tab N of window id XXX" output
    osascript >/dev/null <<EOF
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
      end tell
      tell application "Terminal" to do script "${command}" in front window
EOF
  elif [[ "${the_app}" == 'iTerm' ]]; then
    osascript <<EOF
      tell application "iTerm"
        set current_terminal to current terminal
        tell current_terminal
          launch session "Default Session"
          set current_session to current session
          tell current_session
            write text "${command}"
          end tell
        end tell
      end tell
EOF
  else
    echo "tab: unsupported terminal app: ${the_app}"
    false
  fi
}

function vsplit-tab {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_osx_get_frontmost_app)

  if [[ "${the_app}" == 'iTerm' ]]; then
    osascript <<EOF
      -- tell application "iTerm" to activate
      tell application "System Events"
        tell process "iTerm"
          tell menu item "Split Vertically With Current Profile" of menu "Shell" of menu bar item "Shell" of menu bar 1
            click
          end tell
        end tell
        keystroke "${command} \n"
      end tell
EOF
  else
    echo "$0: unsupported terminal app: ${the_app}" >&2
    false
  fi
}

function split-tab {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_osx_get_frontmost_app)

  if [[ "${the_app}" == 'iTerm' ]]; then
    osascript 2>/dev/null <<EOF
      tell application "iTerm" to activate
      tell application "System Events"
        tell process "iTerm"
          tell menu item "Split Horizontally With Current Profile" of menu "Shell" of menu bar item "Shell" of menu bar 1
            click
          end tell
        end tell
        keystroke "${command} \n"
      end tell
EOF
  else
    echo "$0: unsupported terminal app: ${the_app}" >&2
    false
  fi
}

# Cleanup OS X crap
function rm-osx-cruft {
  find "${@:-$PWD}" \( \
    -type f -name '.DS_Store' -o \
    -type f -name '__MACOSX' \
  \) -print0 | xargs -0 rm -rf
}

# Opens man pages in Preview.app
function manp {
  local page
  if (( $# > 0 )); then
    for page in $@; do
      man -t "$page" | open -f -a Preview
    done
  else
    echo "What manual page do you want?" >&2
  fi
}

# Sends a notification to OS X when a command is finished executing
function notify {
  eval "$@" && terminal-notifier -message "\`$*\` completed in ${PWD##*/}" || terminal-notifier -message "\`$*\` in ${PWD##*/}"
}

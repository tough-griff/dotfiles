function tab {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  osascript <<EOF
    tell application "iTerm2"
      tell current window
        set newTab to (create tab with default profile)
        tell current tab
          repeat with thisSession in sessions
            tell thisSession
              write text "${command}"
            end tell
          end repeat
        end tell
      end tell
    end tell
EOF
}

function hsplit {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  osascript <<EOF
    tell application "iTerm2"
      tell current session of first window
        set newSession to (split horizontally with same profile)
        tell newSession
          write text "${command}"
        end tell
      end tell
    end tell
EOF
}

function vsplit {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  osascript <<EOF
    tell application "iTerm2"
      tell current session of first window
        set newSession to (split vertically with same profile)
        tell newSession
          write text "${command}"
        end tell
      end tell
    end tell
EOF
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
      man -t "${page}" | open -f -a Preview
    done
  else
    echo "What manual page do you want?" >&2
  fi
}

# Sends a notification to OS X when a command is finished executing
function notify {
  eval "$@" && terminal-notifier -message "\`$*\` completed in ${PWD##*/}" || terminal-notifier -message "\`$*\` in ${PWD##*/}"
}

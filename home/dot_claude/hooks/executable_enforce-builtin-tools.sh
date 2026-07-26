#!/usr/bin/env bash

LC_ALL=C

COMMAND=$(jq -r '.tool_input.command' 2>/dev/null)
[ -z "$COMMAND" ] && exit 0

deny() {
  # backticks below are literal, for the JSON message text
  # shellcheck disable=SC2016
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Do not use `%s`. %s"}}\n' "$1" "$2"
  exit 0
}

msg_for() {
  case "$1" in
    cat) echo "Use the Read tool to read files, or Write to create them" ;;
    sed) echo "Use the Edit tool for modifications, or Read for viewing line ranges" ;;
    awk) echo "Use Read or Edit tools instead" ;;
    *) return 1 ;;
  esac
}

# Only acts on the first word of each top-level segment (segment_start=1);
# quoting/escaping is tracked so |, ;, & inside quotes are never treated as
# separators and words built from quoted text are never mistaken for a
# command name.
check_word() {
  local w="$1"
  [ -z "$w" ] && return
  [ "$segment_start" -eq 1 ] || return
  if [[ "$w" =~ ^[A-Za-z_][A-Za-z_0-9]*=.*$ ]]; then
    return
  fi
  local base="${w##*/}" msg
  if msg=$(msg_for "$base"); then
    deny "$base" "$msg"
  fi
  segment_start=0
}

len=${#COMMAND}
i=0
word=""
in_squote=0
in_dquote=0
segment_start=1

while [ "$i" -lt "$len" ]; do
  c="${COMMAND:$i:1}"

  if [ "$in_squote" -eq 1 ]; then
    if [ "$c" = "'" ]; then in_squote=0; else word+="$c"; fi
    i=$((i + 1))
    continue
  fi

  if [ "$in_dquote" -eq 1 ]; then
    if [ "$c" = "\\" ] && [ $((i + 1)) -lt "$len" ]; then
      nc="${COMMAND:$((i + 1)):1}"
      case "$nc" in
        '"' | "\\" | '$' | '`') word+="$nc"; i=$((i + 2)); continue ;;
      esac
    elif [ "$c" = '"' ]; then
      in_dquote=0
      i=$((i + 1))
      continue
    fi
    word+="$c"
    i=$((i + 1))
    continue
  fi

  case "$c" in
    "'") in_squote=1; i=$((i + 1)) ;;
    '"') in_dquote=1; i=$((i + 1)) ;;
    "\\")
      if [ $((i + 1)) -lt "$len" ]; then
        word+="${COMMAND:$((i + 1)):1}"
        i=$((i + 2))
      else
        i=$((i + 1))
      fi
      ;;
    ' ' | $'\t' | $'\n' | $'\r')
      check_word "$word"
      word=""
      i=$((i + 1))
      ;;
    '|' | '&' | ';')
      check_word "$word"
      word=""
      nc="${COMMAND:$((i + 1)):1}"
      if { [ "$c" = '|' ] && { [ "$nc" = '|' ] || [ "$nc" = '&' ]; }; } ||
        { [ "$c" = '&' ] && [ "$nc" = '&' ]; } ||
        { [ "$c" = ';' ] && [ "$nc" = ';' ]; }; then
        i=$((i + 2))
      else
        i=$((i + 1))
      fi
      segment_start=1
      ;;
    *)
      word+="$c"
      i=$((i + 1))
      ;;
  esac
done
check_word "$word"
exit 0
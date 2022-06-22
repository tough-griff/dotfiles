#!/usr/bin/env bash

set -e

_indent() {
  sed "s/^/  /"
}

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

echo "# $(date -R)"
git add -A
echo "$ git commit"
git commit -m "Daily automated config update" 2>&1 | _indent
echo "$ git push"
git push 2>&1 | _indent
echo

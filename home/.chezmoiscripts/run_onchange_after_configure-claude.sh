#!/bin/bash
set -eufo pipefail

if ! command -v claude >/dev/null 2>&1; then
  echo "claude CLI not found; skipping plugin setup"
  exit 0
fi

claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add upstash/context7

claude plugin install -y github@claude-plugins-official
claude plugin install -y context7@context7-marketplace

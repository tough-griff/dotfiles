#!/bin/bash
set -eufo pipefail

# Register the GitHub MCP server (user scope) identically on every machine.
# Auth is resolved at connect time by ~/.claude/helpers/github-mcp-auth.sh via
# `gh auth token`, so no credential is stored in ~/.claude.json.

if ! command -v claude >/dev/null 2>&1; then
  echo "claude CLI not found; skipping GitHub MCP setup"
  exit 0
fi

desired="$(cat <<JSON
{
  "type": "http",
  "url": "https://api.githubcopilot.com/mcp/",
  "headersHelper": "bash $HOME/.claude/helpers/github-mcp-auth.sh"
}
JSON
)"

claude mcp remove -s user github >/dev/null 2>&1 || true
claude mcp add-json -s user github "$desired"
echo "Configured GitHub MCP server (user scope)"

#!/bin/bash
# headersHelper for the GitHub MCP server: emits a JSON object of headers on
# stdout, re-run by Claude Code on every connection so the token stays fresh.
printf '{"Authorization": "Bearer %s"}' "$(gh auth token)"

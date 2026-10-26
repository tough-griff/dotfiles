---
paths:
  - "home/dot_claude/**"
  - "home/dot_claude.personal/**"
  - "home/.chezmoitemplates/claude-settings"
  - "home/.chezmoidata/claude.yaml"
  - "home/Developer/dot_envrc"
---

# Claude Code profiles

`~/.claude` is rendered from `home/dot_claude/`. On a work machine it is the work profile, and `home/dot_claude.personal/` adds a personal profile at `~/.claude.personal` that symlinks back to `~/.claude` for everything except `settings.json`. The personal profile is selected by `home/Developer/dot_envrc`, which sets `CLAUDE_CONFIG_DIR` and is work-only (see `home/.chezmoiignore.tmpl`).

Both `settings.json` files are `modify_` templates that render `home/.chezmoitemplates/claude-settings`. It merges `home/.chezmoidata/claude.yaml` (personal and default values) onto the live file, so keys not in `claude.yaml`, such as `autoMode`, stay unmanaged and per profile. Work-profile overrides go in the template's `.work` block. The merge never removes keys, so deleting a key from `claude.yaml` leaves it in the live files.

`modify-template` files cannot call named templates with `{{ template }}`, so use `includeTemplate`. Keep files in `.chezmoitemplates/` extensionless so editors don't reformat them.

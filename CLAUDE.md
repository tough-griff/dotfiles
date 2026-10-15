# CLAUDE.md

Personal chezmoi dotfiles for macOS, Linux, and Windows. The source root is `home/` (via `.chezmoiroot`).

## Validating changes

There is no test suite. Check changes with `chezmoi diff` and `chezmoi apply -v`, and lint shell scripts with `shellcheck` and `shfmt`.

## Conventions

- Add or remove packages and fonts in `home/.chezmoidata/packages.yaml` and `fonts.yaml`, not in the install scripts.
- `.chezmoidata` files are static. Anything that depends on `.work`, `.chezmoi.os`, or similar is computed in a template.
- Secrets come from 1Password through `op` at apply time. Never hardcode them. `.prepare.sh` and `.prepare.cmd` install `op` before templates run.
- Fish `conf.d` files load alphabetically, so the `0-` and `00-` prefixes set load order. Git Bash on Windows mirrors the fish layout in `home/private_dot_config/bash/conf.d/`.

## Claude Code profiles

`~/.claude` is rendered from `home/dot_claude/`. On a work machine it is the work profile, and `home/dot_claude.personal/` adds a personal profile at `~/.claude.personal` that symlinks back to `~/.claude` for everything except `settings.json`. The personal profile is selected by `home/Developer/dot_envrc`, which sets `CLAUDE_CONFIG_DIR` and is work-only (see `home/.chezmoiignore.tmpl`).

Both `settings.json` files are `modify_` templates that render `home/.chezmoitemplates/claude-settings`. It merges `home/.chezmoidata/claude.yaml` (personal and default values) onto the live file, so keys not in `claude.yaml`, such as `autoMode`, stay unmanaged and per profile. Work-profile overrides go in the template's `.work` block. The merge never removes keys, so deleting a key from `claude.yaml` leaves it in the live files.

`modify-template` files cannot call named templates with `{{ template }}`, so use `includeTemplate`. Keep files in `.chezmoitemplates/` extensionless so editors don't reformat them.

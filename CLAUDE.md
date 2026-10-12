# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi), targeting macOS, Linux, and Windows. The chezmoi source root is `home/` (set via `.chezmoiroot`), so every file chezmoi manages lives under `home/`, not the repo root.

## Commands

Re-run onchange/prepare scripts (installs Homebrew, 1Password CLI, etc.) by touching the relevant `run_onchange_*` file or running `chezmoi apply` after editing `home/.chezmoidata/packages.yaml`.

There is no build/lint/test suite in this repo — validate changes by running `chezmoi diff`/`chezmoi apply -v` and, for shell scripts, `shellcheck`/`shfmt` (both are installed via `packages.yaml` and are the linters this repo expects).

## Architecture

**Config data flow**: `home/.chezmoi.yaml.tmpl` is the entrypoint for chezmoi's config. It computes/prompts for `ephemeral`, `headless`, `hostname`, `email`, `work` (derived from hostname prefix `GYOURICK-`), and `onepasswordMode`, and wires `.prepare.sh`/`.prepare.cmd` as a `read-source-state` pre-hook (these install Homebrew + the 1Password CLI before chezmoi reads any templates, since templates/scripts assume `op` is available for secrets). Static package/font lists live in `home/.chezmoidata/packages.yaml` and `fonts.yaml`; onchange scripts read these to install Homebrew formulae/casks and fonts, so editing those YAML files is the way to add/remove packages (not editing the install scripts directly).

**Claude Code config split**: `home/dot_claude/` is the single source of truth for Claude Code config (`CLAUDE.md`, `settings.json`, `skills/`, `agents/`, `commands/`) and always applies to `~/.claude/`. `home/dot_claude.personal/` and `home/dot_claude.work/` are _profile overlays_, each containing only `symlink_*.tmpl` files that point `~/.claude.personal/{CLAUDE.md,settings.json,keybindings.json,plugins,skills,agents,commands}` and `~/.claude.work/{...}` back at `~/.claude/...`. These overlay directories are only materialized when `.work` is true (see `home/.chezmoiignore.tmpl`) — i.e. they exist to let a work machine keep a separate Claude profile that still resolves back to the same base config.

**Secrets**: 1Password is the secrets backend. `.prepare.sh`/`.prepare.cmd` ensure the `op` CLI is present before chezmoi templates run; `home/.chezmoi.yaml.tmpl`'s `onepasswordMode` (`account`/`connect`/`service`) controls how chezmoi authenticates to it. Templates for `private_dot_ssh/`, `private_dot_aws/`, `private_dot_gnupg/` pull key material via `op` at apply time — never hardcode secrets into these templates.

**Shell setup**: fish is the primary shell (`home/private_dot_config/fish/`), with `conf.d/*.fish` for tool integrations (loaded alphabetically, hence the `0-`/`00-` prefixes for load-order-sensitive files like PATH setup and Homebrew shellenv) and `functions/` for one-function-per-file fish functions. Git Bash on Windows is the secondary interactive shell and mirrors that layout: `home/private_dot_config/bash/conf.d/*.sh` is sourced by `dot_bashrc.tmpl` (after an interactive-shell guard) and ports the fish `conf.d`/`functions` content one file per tool, each self-gating with `command -v`. `dot_bashrc.tmpl` applies on every OS; `dot_bash_profile` sources `~/.profile` then `~/.bashrc` for login shells. `dot_zshrc`/`dot_zshenv.tmpl` remain a minimal fallback/interop layer.

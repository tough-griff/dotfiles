# CLAUDE.md

Personal chezmoi dotfiles for macOS, Linux, and Windows. The source root is `home/` (via `.chezmoiroot`).

## Validating changes

- There is no test suite. Check changes with `chezmoi diff` and lint scripts with `shellcheck`, `shfmt`, `PSScriptAnalyzer`, `fish --no-execute`, and `fish_indent --check`.
- Check JSON and YAML syntax with `jq empty` and `yq`. Skip `.vscode/` files (JSONC allows comments and trailing commas) and `modify_` files (templates, not JSON).
- Lint `.tmpl` files on their rendered output from `chezmoi execute-template`, not the template source.
- Only lint files for the OS you're running on. Windows has no fish, and macOS and Linux have no PowerShell, so skip files for the other platform instead of looking for or installing their tools.
- Don't apply changes with `chezmoi apply`, leave that for the user to do.

## Conventions

- Add or remove packages and fonts in `home/.chezmoidata/packages.yaml` and `fonts.yaml`, not in the install scripts.
- `.chezmoidata` files are static. Anything that depends on `.work`, `.chezmoi.os`, or similar is computed in a template.
- Secrets come from 1Password through `op` at apply time. Never hardcode them. `.prepare.sh` and `.prepare.cmd` install `op` before templates run.
- Fish `conf.d` files load alphabetically, so the `0-` and `00-` prefixes set load order. Git Bash on Windows mirrors the fish layout in `home/private_dot_config/bash/conf.d/`.

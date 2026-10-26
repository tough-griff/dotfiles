# tough-griff/dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Install with:

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply tough-griff
```

or if chezmoi is already present:

```sh
chezmoi init --apply tough-griff
```

Secrets are read from 1Password through the desktop app. Where the app is
unavailable (headless or ephemeral machines, or non-interactive installs),
export a service account token first:

```sh
export OP_SERVICE_ACCOUNT_TOKEN="XXXXXYYYYYZZZZZ"
```

## Notes

### Create symlinks

For chezmoi to be able to create symlinks, the current user must have the
appropriate permissions. This can be achieved by turning on developer mode or
setting the permission `SeCreateSymbolicLinkPrivilege` directly.

# tough-griff/dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Install with:

```sh
export OP_SERVICE_ACCOUNT_TOKEN="XXXXXYYYYYZZZZZ"
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply tough-griff
```

or if chezmoi is already present:

```sh
export OP_SERVICE_ACCOUNT_TOKEN="XXXXXYYYYYZZZZZ"
chezmoi init --apply tough-griff
```

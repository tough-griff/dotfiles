# tough-griff/dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

On a fresh Mac, install the Xcode Command Line Tools first, since chezmoi clones
with the system `git`:

```sh
xcode-select --install
```

Install with:

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply tough-griff
```

or if chezmoi is already present:

```sh
chezmoi init --apply tough-griff
```

Secrets are read from 1Password through the desktop app. Install it, sign in,
and turn on Settings > Developer > Integrate with 1Password CLI before
installing (on Windows: `winget install AgileBits.1Password`). Where the app is
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

## Credits

The One Dark Pro colors in [`assets/one-pro.json`](assets/one-pro.json) and the
iTerm2 profile are adapted from
[Binaryify/OneDark-Pro](https://github.com/Binaryify/OneDark-Pro), and the One
Light Pro colors are derived from them. Both are used under the MIT License:

```text
The MIT License (MIT)

Copyright (c) 2013-2022 Binaryify

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

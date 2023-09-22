# chezmoi:template:left-delimiter="# {{" right-delimiter="}}"
# {{- if eq .chezmoi.os "darwin" -}}
if test -x /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
else if test -x /usr/local/bin/brew
    eval "$(/usr/local/bin/brew shellenv)"
end
# {{- else if eq .chezmoi.os "linux" -}}
if test -x "/home/linuxbrew/.linuxbrew/bin/brew"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else if test -x "$HOME/.linuxbrew/bin/brew"
    eval "$($HOME/.linuxbrew/bin/brew shellenv)"
end
# {{- end -}}
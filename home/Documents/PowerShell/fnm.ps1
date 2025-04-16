if (Get-Command fnm -ErrorAction SilentlyContinue) {
    fnm env --use-on-cd --version-file-strategy=recursive --shell powershell | Out-String | Invoke-Expression
}

if (Get-Command eza -ErrorAction SilentlyContinue) {
  Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
  function ls { eza -F --group-directories-first @args }
  function ll { ls -l @args }
  function la { ls -al @args }
  function lt { ls -al --tree @args }
}

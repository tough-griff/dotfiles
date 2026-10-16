# The 1Password SSH agent listens on the same named pipe as the built-in agent.
gsudo { Stop-Service ssh-agent; Set-Service ssh-agent -StartupType Disabled }

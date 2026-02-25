# To run this script:
# 1. Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# 2. Run `chezmoi apply ~/.chezmoiscripts/windows/remove-apps.ps1`
op document get keut7m33ci3kiovpx3kjjydb4e | gpg --import
op document get erkyqjbuzxptdvxwlkbyudkn3e | gpg --import-ownertrust

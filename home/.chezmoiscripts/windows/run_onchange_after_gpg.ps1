# To run this script:
# 1. Run `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process`
# 2. Run `chezmoi apply ~/.chezmoiscripts/windows/remove-apps.ps1`
op document get qjak7e3w77zhlohdjedl3ag4vi | gpg --import
op document get xyofootrl4b2urkh63vpsdztii | gpg --import-ownertrust

# Aliases in this file are bash and zsh compatible

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Show human friendly numbers and colors
alias ls='ls -h --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias l.='ls -lh -d .*'
alias df='df -H'
alias du='du -h -d 1'

# Show me files matching "ls grep"
alias lsg='la | grep'

# Alias Editing
alias ae='nano ~/.dotfiles/zsh/aliases.zsh'    # alias edit
alias ar='source ~/.dotfiles/zsh/aliases.zsh' # alias reload

# zsh profile editing
alias ze='nano ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfa='git fetch --all --verbose --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push'
alias gphm='git push heroku master'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gu='git up'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias cl='clear'
alias path='echo -e ${PATH//:/\\n}'   # print path entries one-per-line
alias fpath='echo -e ${FPATH//:/\\n}' # print fpath entries one-per-line

# Zippin
alias gz='tar -zcvf'

# Kill
alias ka9='killall -9'
alias k9='kill -9'

# Zeus
alias zeus='NOEXEC_DISABLE=1 zeus'
alias zc='zeus console'
alias zg='zeus generate'
alias zrk='zeus rake'
alias zrs='zeus rspec spec'
alias zs='zeus start'

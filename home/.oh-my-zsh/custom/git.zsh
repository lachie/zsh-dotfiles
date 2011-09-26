alias gf="git fetch"
compdef _git gf=git-fetch

alias ga="git add"
alias gap="git add -p"

alias gx='gitx'

export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s'

alias glog='git log $git_concise_log_format'
alias gl='glog --graph'
alias glg='git log --graph --oneline --decorate'

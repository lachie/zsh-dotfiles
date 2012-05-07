alias gf="git fetch"
compdef _git gf=git-fetch

alias ga="git add"
alias gap="git add -p"

alias gx='gitx'
alias gd='git diff'

function gdx() {
  git diff $* | gitx
}

export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s'

alias glog='git log $git_concise_log_format'
alias gl='glog --graph'
alias glg='git log --graph --oneline --decorate'



function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'


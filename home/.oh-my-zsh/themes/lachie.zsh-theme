autoload -U git_clean

#autoload -U add-zsh-hook

#add-zsh-hook precmd prompt_lachie_precmd
#add-zsh-hook precmd prompt_lachie_chpwd

#prompt_lachie_precmd () {
#}
#prompt_lachie_chpwd () {
#}

pr_git_info () {
  if in_git_repo; then
    echo -n "%B%F{black}$(current_git_branch)%b%F{white}@%B%F{black}$(current_git_sha)%b"
    (! git_clean) && echo -n " %F{red}±"
  fi
}

pr_path () {
  local col=yellow
  test -w "." || col=red
  echo "%F{$col}$(~/.zsh/bin/squash_pwd.pl)"
}

pr_login () {
  [[ ! -z "$SSH_CONNECTION" ]] && echo -n "%F{green}[$(hostname -s)] "
  local whoami=$(whoami)
  [[ "$whoami" != "lachie" ]] && echo -n "%F{green}${whoami}@(hostname -s) "
}

pr_repo () {
  local remote=$(git config --get branch.$(current_git_branch).remote)
  if [[ ! -z "$remote" ]]; then
    local url=$(git config --get remote.${remote}.url 2> /dev/null)
    echo "%B%F{black}${remote} ${url}%b"
  fi
}

PROMPT='$(pr_login)$(pr_path)%F{blue}%F{blue}» %f'
RPROMPT='$(pr_git_info)%f'

# vim: ft=zsh

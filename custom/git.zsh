alias gf="git fetch --prune"
compdef _git gf=git-fetch

alias ga="git add"
alias gap="git add -p"

if [ -x '/usr/local/bin/gitx' ]; then
  alias gx='gitx'
else
  function gx() {
    gitk --all $* &
  }
fi
alias gd='git diff'

alias gcola='git cola &'

alias gpoh="git push --set-upstream origin HEAD"

function gdx() {
  git diff $* | gitx
}

export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s'

alias glog='git log $git_concise_log_format'
alias gl='glog --graph'
alias glg='git log --graph --oneline --decorate'

function grh() {
  local branch
  branch=${1-HEAD}
  git reset --hard $branch
}

function gro() {
  local branch
  branch=origin/${1-$(git cb)}
  git fetch && git reset --hard $branch
}

alias gm='git merge --no-ff'
alias gmff='git merge'


alias gcot='git checkout -t'
compdef _git gcot=git-checkout
alias gcob='git checkout -b'
compdef _git gcob=git-checkout


# gup and friends - use the shared Dropbox version
# source $HOME/Dropbox/Blake/sync/shell/gup.sh


function grelease() {
  if ! git diff-index --quiet HEAD; then
    echo "repo is dirty; please git stash of commit, then rerun"
    return
  fi

  old_release=$(cat ./CURRENT_GIT_FLOW_RELEASE 2> /dev/null)
  if [[ -z "$old_release" ]]; then
    echo "existing release '$old_release' found in ./CURRENT_GIT_FLOW_RELEASE; please clean this up, then rerun"
    return
  fi

  # TODO handle multiple releases per day
  release=$(date +%Y-%m-%d)

  echo "releasing $release"
  echo $release > CURRENT_GIT_FLOW_RELEASE

  git checkout master && \
  gup && \
  git checkout develop && \
  gup && \
  git flow release start $release || {
    echo "git flow failed"
    return
  }


  bundle exec cap staging export_sitecopy && bundle exec rake manage_content:download_sitecopy

  # TODO download new asset manifest

  if ! git diff-index --quiet HEAD; then
    echo -n "please inspect these automatically added changes and commit as necessary; "
    git diff
  else
    echo -n "please inspect your shiny new release branch"
  fi

  echo "; when you're finished, run grelease_finish"
}


function grelease_finish() {
  release=$(cat ./CURRENT_GIT_FLOW_RELEASE 2> /dev/null)
  if [[ -z "$release" ]]; then
    echo "no current release found... did you start one with 'grelease' first?"
    return
  fi

  echo "finishing release $release"

  git flow release finish $release && \
  git push --tags origin master && \
  git push origin develop

  rm ./CURRENT_GIT_FLOW_RELEASE
}


function gcl() {
  local remote=$1
  local localdir=$2

  git clone $*

  if [[ -z "$localdir" ]]; then
    localdir=${remote%.git}
    localdir=${localdir##*/}
  fi

  ( cd $localdir && add_project )
}

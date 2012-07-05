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

alias grh="git reset --hard HEAD"

alias gm='git merge --no-ff'


# gup and friends
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias grb='git rebase -p'


alias gup_base='git fetch origin && grb origin/$(git_current_branch)'


function gup() {
  if ! git diff-index --quiet HEAD; then
    echo your index is dirty
    echo please git stash or commit, then rerun gup
  else
    gup_base
    git submodule update --init
  fi
}


# git reset hard - gup
function guph() {
  if ! git diff-index --quiet HEAD; then
    echo your index is dirty
    echo pressing enter blows your changes away
    echo ctrl-c to back out

    read
  fi

  git reset --hard HEAD
  gup_base

  git submodule update --init
}


# stash - gup - stash pop
function gups() {
  local stashed
  stashed=$(git stash)

  gup_base

  if [[ $stashed != "No local changes to save" ]]
  then
    git stash pop
  else
    git submodule update --init
  fi
}


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

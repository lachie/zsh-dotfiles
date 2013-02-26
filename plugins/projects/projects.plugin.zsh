p_completion_cache=$HOME/.config/completion_caches/p/repos.sqlite
project_roots=($HOME/dev $HOME/Dropbox/dev $HOME/Blake)


# main commands
# cd to a project
p() {
  if [[ -z "$1" ]]; then
    cd $(git rev-parse --show-cdup)
  else
    cd $(sqlite3 -list $p_completion_cache "select path from git_repos where basename='$1' limit 1")
  fi
}


# open a project in $EDITOR
m() {
  if [[ $# -eq 0 ]]; then
    mvim .
  else
    mvim $(project_resolve $1)
  fi
}


add_project() {
  local base
  base=$(basename $PWD)
  
  sqlite3 -batch $p_completion_cache "insert into git_repos values('$base','$base','$PWD',1)"
}


projects_create_db() {
  mkdir -p $(dirname $p_completion_cache)
  sqlite3 -batch $p_completion_cache "CREATE TABLE git_repos (name varchar(255), basename varchar(255), path text, save integer);"
}


# reindex the projects
projects_reindex() {
  shallow_git_find $p_completion_cache $project_roots
}


# open the project db in sqlite repl
projects_sqlite() {
  sqlite3 $p_completion_cache
}


project_resolve() {
  local project_path
  
  project_path=$(sqlite3 -list -separator \t $p_completion_cache "select path from git_repos where basename='$1'")

  echo "${project_path:-$1}"
}


project_list() {
  prefix=$1
  reply=( $(sqlite3 -list $p_completion_cache "select basename from git_repos where basename like '$prefix%'") )
}


compctl -K project_list p
compctl -K project_list -g '*' m

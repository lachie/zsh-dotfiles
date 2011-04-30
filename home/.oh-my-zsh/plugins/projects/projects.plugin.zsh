p_completion_cache=$HOME/.config/completion_caches/p/repos.sqlite
project_roots=($HOME/dev $HOME/Dropbox/dev)


# main commands
# cd to a project
p() {
  cd $(sqlite3 -list $p_completion_cache "select path from git_repos where basename='$1' limit 1")
}


# open a project in mvim
m() {
  if [[ $# -eq 0 ]]
  then
    mvim .
  else
    mvim $(project_resolve $1)
  fi
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

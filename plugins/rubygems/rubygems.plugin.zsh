find_gem() {
  local bundled
  local system_gem

  bundled=$(bundle show $@ --no-color | grep -v 'Resolving dependencies...')
  if [[ -n "$bundled" && ! $bundled =~ '^Could not find gem' ]]
  then
    echo $bundled
    return
  fi

  system_gem=$(fgem $@)
  if [[ -n "$system_gem" ]]
  then
    echo $system_gem
  else
    echo "gem '$@' not found" 1>&2
  fi
}

cdgem() {
  gem=$(find_gem $@)
  [[ -z "$gem" ]] && return

  cd $gem/lib
}

vigem() {
  gem=$(find_gem $@)
  [[ -z "$gem" ]] && return

  mvim $gem/lib
}

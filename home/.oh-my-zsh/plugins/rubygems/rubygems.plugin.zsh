find_gem() {
  local bundled
  bundled=$(bundle show $@ --no-color)
  # bundled=${bundled:#Could not locate Gemfile}
  echo ${bundled:-$(fgem $@)}
}

cdgem() {
  cd $(find_gem $@)
}

vigem() {
  mvim $(find_gem $@)/lib
}

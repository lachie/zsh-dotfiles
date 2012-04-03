function rbenv_prompt_info() {
  ruby_version=$(rbenv version-name 2> /dev/null) || return
  echo "($ruby_version)"
}


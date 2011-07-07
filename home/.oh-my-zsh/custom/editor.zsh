export EDITOR=/usr/bin/vim

function mvim()
{
  # spawn a sub-shell, unset environment variables for the sub-shell, start mvim. 
  (unset GEM_PATH; unset GEM_HOME; command mvim "$@")
}


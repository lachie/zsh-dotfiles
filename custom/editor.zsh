export EDITOR=/usr/local/bin/vim

function mvim()
{
  # spawn a sub-shell, unset environment variables for the sub-shell, start mvim. 
  # match ruby version vim was built against
  (
    if [ -x $HOME/bin/mvim ]; then
      rbenv shell system
      command $HOME/bin/mvim "$@"
    else
      # TODO write this value somewhere?
      rbenv shell 1.9.3-p327
      command $EDITOR "$@"
    fi
  )
}

bindkey -v 

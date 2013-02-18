path=( $HOME/.rbenv/bin $HOME/.rbenv/shims /usr/local/share/npm/bin $HOME/bin $HOME/Dropbox/Blake/sync/bin /usr/local/bin /usr/local/sbin /usr/local/flex/bin  $path )
export CAPER_HOME=~/dev/blake/caper

eval "$(rbenv init - zsh)"
eval "$($HOME/Blake/blake-cloud/bin/bc init - zsh)"

export TERM=rxvt-256color

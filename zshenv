path=( /usr/local/go/bin /usr/local/heroku/bin /usr/local/share/npm/bin $HOME/bin $HOME/Dropbox/Blake/sync/bin /usr/local/bin /usr/local/sbin /usr/local/flex/bin  $path )
# path=( $HOME/.rbenv/bin $HOME/.rbenv/shims /usr/local/share/npm/bin $HOME/bin $HOME/Dropbox/Blake/sync/bin /usr/local/bin /usr/local/sbin /usr/local/flex/bin  $path )
export CAPER_HOME=~/dev/blake/caper

source /usr/local/share/chruby/chruby.sh
chruby ruby-1.9.3-p448

# eval "$(rbenv init - zsh)"
eval "$($HOME/Blake/bx/bin/bx init -)"
eval "$($HOME/Blake/blake-cloud/bin/bc init - zsh)"

if [ "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="rxvt-256color"
fi

# export GOPATH=$HOME/dev/go:$HOME/dev/blake
export GOPATH=$HOME/dev/blake/go

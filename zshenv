path=( 
  /usr/local/go/bin 
  $HOME/dev/blake/go/bin
  /usr/local/heroku/bin
  /usr/local/share/npm/bin
  $HOME/bin
  $HOME/Dropbox/Blake/sync/bin
  /usr/local/bin
  /usr/local/sbia
  /usr/local/flex/bin
  $path )
# path=( $HOME/.rbenv/bin $HOME/.rbenv/shims /usr/local/share/npm/bin $HOME/bin $HOME/Dropbox/Blake/sync/bin /usr/local/bin /usr/local/sbin /usr/local/flex/bin  $path )
export CAPER_HOME=~/dev/blake/caper

source /usr/local/share/chruby/chruby.sh
chruby ruby-2.1.5

# eval "$(rbenv init - zsh)"
eval "$($HOME/Blake/bx/bin/bx init -)"
eval "$($HOME/Blake/blake-cloud/bin/bc init - zsh)"

if [ "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="rxvt-256color"
fi

# export GOPATH=$HOME/dev/go:$HOME/dev/blake
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/blake/go

export FLEETCTL_TUNNEL=s1.ops-production.oregon.bxip.info:22

export DOCKER_HOST=http://127.0.0.1:2375

source ~/.nvm/nvm.sh
nvm use v0.12.7

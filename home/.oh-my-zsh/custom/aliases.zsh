alias vlc="/Applications/VLC.app/Contents/MacOS/VLC &"
alias wireshark="sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark"
alias edhosts="sudo mvim /etc/hosts"

alias start_mongod="mongod --config /usr/local/Cellar/mongodb/1.6.5-x86_64/mongod.conf"

alias less="less -r"

function apk() {
  ack "$@" app lib
}

function f() {
  find . -iname "*$**"
}

alias dl="curl -L -O"

export dropbox=$HOME/Dropbox
export p2dropbox=$dropbox/Plus2

export dev=$HOME/dev
export p2dev=$dev/plus2

alias dl='curl -L -O'

alias bridge="ssh bridge -t tmux attach"

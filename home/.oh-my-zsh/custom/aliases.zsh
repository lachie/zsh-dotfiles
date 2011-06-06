alias vlc="/Applications/VLC.app/Contents/MacOS/VLC &"
alias edhosts="sudo mvim /etc/hosts"

alias less="less -r"

function apk() {
  ack "$@" app lib
}

function f() {
  find . -iname "*$**"
}

export dropbox=$HOME/Dropbox
export p2dropbox=$dropbox/Plus2

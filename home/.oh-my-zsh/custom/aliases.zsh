alias vlc="/Applications/VLC.app/Contents/MacOS/VLC &"
alias edhosts="sudo mvim /etc/hosts"

alias mcsync="rsync -avz -P home:Library/Application\\\ Support/minecraft/ ~/Library/Application\ Support/minecraft"
alias mcsyncback="rsync -avz -P ~/Library/Application\ Support/minecraft/ home:Library/Application\\\ Support/minecraft"

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

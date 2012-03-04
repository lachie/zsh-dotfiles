alias vlc="/Applications/VLC.app/Contents/MacOS/VLC &"
alias wireshark="sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark"
alias edhosts="sudo mvim /etc/hosts"

alias mcsync="rsync -avz -P home:Library/Application\\\ Support/minecraft/ ~/Library/Application\ Support/minecraft"
alias mcsyncback="rsync -avz -P ~/Library/Application\ Support/minecraft/ home:Library/Application\\\ Support/minecraft"

alias start_mongod="mongod --config /usr/local/Cellar/mongodb/1.6.5-x86_64/mongod.conf"

alias less="less -r"

function apk() {
  ack "$@" app lib spec
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

alias ssh-key="cat ~/.ssh/id_rsa.pub | pbcopy"

alias apt-get="sudo apt-get"
alias aptitude="sudo aptitude"
alias vi="vim"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

function naut () {
  local DIR="${1-.}"
  nautilus --no-desktop $DIR
}

srvdropbox() {
  cd ~/Dropbox/Sync/1Password.agilekeychain
  (
    sleep 1
    google-chrome http://0.0.0.0:8000/1Password.html
  ) &
  python -mSimpleHTTPServer
}

alias apts="aptitude search"
alias apti="apt-get install"

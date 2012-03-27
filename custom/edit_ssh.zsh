SSH_HOME=$HOME/Dropbox/Sync/ssh

edssh() {
  mvim $SSH_HOME
}

ressh() {
  cd $SSH_HOME
  ruby build.rb
}

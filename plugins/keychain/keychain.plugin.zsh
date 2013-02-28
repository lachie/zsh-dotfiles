IDS=$(ls $HOME/.ssh/id_?sa)
eval `keychain --eval --quiet --agents ssh $IDS`

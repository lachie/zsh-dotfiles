PEMS=$(ls $HOME/.ssh/*.pem)
eval `keychain --eval --agents ssh id_rsa $PEMS`

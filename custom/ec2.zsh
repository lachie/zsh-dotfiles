export EC2_KEYPAIR_US_EAST_1=default

if [ -x /usr/libexec/java_home ]; then
  JAVA_HOME="$(/usr/libexec/java_home)"
else
  JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
fi
export JAVA_HOME
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"

HOMEBREW_EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
if [ -d $HOMEBREW_EC2_HOME ]; then
  export EC2_HOME=$HOMEBREW_EC2_HOME
fi

export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"

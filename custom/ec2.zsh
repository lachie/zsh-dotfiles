export EC2_KEYPAIR_US_EAST_1=default

if [ -x /usr/libexec/java_home ]; then
  JAVA_HOME="$(/usr/libexec/java_home)"
else
  JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
fi
export JAVA_HOME
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-lachie.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-lachie.pem)"


# autoscaling
export AWS_AUTO_SCALING_HOME=$HOME/Downloads/AutoScaling-1.0.61.2
export AWS_IAM_HOME=$HOME/.ec2/IAMCli-1.5.0

export AWS_DEFAULT_REGION=us-west-2


HOMEBREW_EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
if [ -d $HOMEBREW_EC2_HOME ]; then
  export EC2_HOME=$HOMEBREW_EC2_HOME
  export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"
  export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"
fi


UBUNTU_CFN_HOME="/usr/local/aws/cfn"
if [ -d $UBUNTU_CFN_HOME ]; then
  export AWS_CLOUDFORMATION_HOME=$UBUNTU_CFN_HOME
fi

export AWS_CREDENTIAL_FILE=$HOME/.ec2/credentials.txt

export PATH=$AWS_CLOUDFORMATION_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_IAM_HOME/bin:$PATH

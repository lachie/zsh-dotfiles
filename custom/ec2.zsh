export EC2_KEYPAIR_US_EAST_1=default

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"

export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.3.003/jars"

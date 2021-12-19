# packer
Packer - Cross-platform VM template management

# Doc https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started

# EC2 AMI AmazonLinux


## Install awscli
```
sudo su
rm -fr /usr/bin/aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -i /usr/local/aws-cli -b /usr/local/bin -b /usr/bin
ln -s /usr/local/bin/aws  /usr/bin/aws
```

## Configure awscli
```
aws configure
aws sts get-caller-identity
```

## Install packer
```
sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer
```

### Verify the installation
```
packer --help
```

## Deploy
```
cd /root
git clone https://github.com/lordbasex/packer.git
cd packer

export PACKER_AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
export PACKER_AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)
export AWS_SECRET_ACCESS_KEY="us-east-1"
export AWS_VPC_ID="vpc-XXXXXXXXXXXXXXXX"
export AWS_SUBNET_ID="subnet-XXXXXXXXXXXXXXXX"
export AWS_AMI_NAME="packer-demo"
export AWS_AMI_SOURCE="ami-0ed9277fb7eb570c9" #Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type

packer validate aws-ami.json
packer build aws-ami.json
```


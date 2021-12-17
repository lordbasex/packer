# packer
Packer - Cross-platform VM template management

# Doc https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started

# EC2 AMI AmazonLinux

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

export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)
export AWS_SECRET_ACCESS_KEY="us-east-1"
export AWS_VPC_ID="vpc-XXXXXXXXXXXXXXXX"
export AWS_SUBNET_ID="subnet-XXXXXXXXXXXXXXXX"
export AWS_AMI_NAME="packer-demo"
export AWS_AMI_SOURCE="ami-0ed9277fb7eb570c9"

packer validate aws-ami.json
packer build aws-ami.json
```


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
cd /root/packer
packer validate aws-ami.json
packer build aws-ami.json
```


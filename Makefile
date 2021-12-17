all: build

build:
  export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)
  packer validate aws-ami.json
  packer build aws-ami.json

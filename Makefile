all: build

build:
  packer validate aws-ami.json
  packer build aws-ami.json

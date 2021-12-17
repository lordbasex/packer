SSH_KEY_NAME=packer-demo

all: sshkeygen

sshkeygen:
  mkdir -p scripts
	ssh-keygen -t rsa -N '' -f scripts/${SSH_KEY_NAME} -q 


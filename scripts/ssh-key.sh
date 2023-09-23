#!/usr/bin/env sh

# exit on error
set -o errexit

# exit on <Ctrl-c>
trap 'exit 2' SIGINT

SERVICE_NAME=$1
HOST=$2
LABEL=$3

if [ -z $SERVICE_NAME ]; then
  echo "No service name provided"
  exit 1
fi

FILE="${SERVICE_NAME}_ed25519"

if [ ! -d "$HOME/.ssh" ]; then
  echo "Creating .ssh directory"
  mkdir "$HOME/.ssh"
fi
if [ ! -f "$HOME/.ssh/config" ]; then
  echo "Creating .ssh/config file"
  touch "$HOME/.ssh/config"
fi

if [ -f "$HOME/.ssh/$FILE" ]; then
  echo "ssh key $SERVICE_NAME already exists"
  exit 0
fi

echo "Creating ssh for $SERVICE_NAME with label $LABEL"
ssh-keygen -t ed25519 -f "$HOME/.ssh/$FILE" -C $LABEL

echo "Adding ssh to apple keychain"
ssh-add --apple-use-keychain "$HOME/.ssh/$FILE"

echo "Updating .ssh/config"
tee -a ~/.ssh/config << END

Host $HOST
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/$FILE
END

exit 0

#!/usr/bin/env sh

# exit on error
set -o errexit

# exit on <Ctrl-c>
trap 'exit 2' SIGINT

# Unattended installation of brew
NONINTERACTIVE=1

if ! command -v brew > /dev/null; then
  echo "Installing brew"
  # Will prompt sudo access
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Brew already installed"
fi

brew analytics off

# Install Brewfile contents
brew bundle install

# Install dotnet tools
# We need to check beforehand if tool exists because install will exit 1
# if it already exists.
if [ -z "$(dotnet tool list --global | grep "fsautocomplete")" ]; then
  echo "Installing fsautocomplete"
  dotnet tool install --global fsautocomplete
else
  echo "Updating fsautocomplete"
  dotnet tool update --global fsautocomplete
fi

exit 0

#!/usr/bin/env sh

# exit on error
set -o errexit

# exit on <Ctrl-c>
trap 'exit 2' SIGINT

readonly BASE_PATH="$(git rev-parse --show-toplevel)"

# Create symlink for .gitconfig
if [ -f "$HOME/Brewfile" ]; then
  echo "Removing $HOME/Brewfile"
  rm -f "$HOME/Brewfile"
fi
echo "Creating symlink between $BASE_PATH/Brewfile and $HOME/Brewfile"
ln -s "$BASE_PATH/Brewfile" "$HOME/Brewfile"

exit 0
#!/usr/bin/env sh

# exit on error
set -o errexit

# exit on <Ctrl-c>
trap 'exit 2' SIGINT

readonly BASE_PATH="$(git rev-parse --show-toplevel)"

if [ ! -d "$HOME/.config" ]; then
  echo "Creating $HOME/.config directory"
  mkdir "$HOME/.config"
fi

# Create symlinks for .config
for CONFIG in $BASE_PATH/config/.config/*; do
  NAME=${CONFIG##*/}
  ROOT_CONFIG="$HOME/.config/$NAME"

  echo "Removing $ROOT_CONFIG"
  if [ -d "$ROOT_CONFIG" ]; then
    rm -r "$ROOT_CONFIG"
  else
    rm -f "$ROOT_CONFIG"
  fi

  echo "Creating symlink between $CONFIG and $ROOT_CONFIG"
  ln -s "$CONFIG" "$ROOT_CONFIG"
done

# Create symlink for .gitconfig
if [ -f "$HOME/.gitconfig" ]; then
  echo "Removing $HOME/.gitconfig"
  rm -f "$HOME/.gitconfig"
fi
echo "Creating symlink between $BASE_PATH/config/.gitconfig and $HOME/.gitconfig"
ln -s "$BASE_PATH/config/.gitconfig" "$HOME/.gitconfig"

exit 0
# Dotfiles

Personal dotfiles for quick workspace installation

```sh
git clone git@github.com:ssiltanen/dotfiles
cd dotfiles
# Install brew and packages, set symlinks to configs
make init
# Create ssh key
make service=<name> host=<baseUrl> label=<email> ssh-key
```

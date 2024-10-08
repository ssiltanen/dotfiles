alias pn="pnpm"

set -x DOTNET_NEW_PREFERRED_LANG F#

set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew

! set -q PATH; and set PATH ''
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

! set -q MANPATH; and set MANPATH ''
set -gx MANPATH /opt/homebrew/share/man $MANPATH

! set -q INFOPATH; and set INFOPATH ''
set -gx INFOPATH /opt/homebrew/share/info $INFOPATH

fish_add_path "$HOME"/bin

# Starship installation
starship init fish | source

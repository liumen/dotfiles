# --------------------------------------------------
# Set environment variables
# --------------------------------------------------
if [ -f $HOME/.env ]; then
  . $HOME/.env
fi

# shellcheck source=./themes/colors.theme.bash
BASHCONF=$HOME/.config/bashconf
source $HOME/.config/bin/bash_util.sh
source "$BASHCONF/lib.bash"
source "$BASHCONF/colors.bash"
source "$BASHCONF/githelpers.bash"
source "$BASHCONF/base.bash"
source "$BASHCONF/modern.theme.bash"

# Enable vi mode
set -o vi

# --------------------------------------------------
# Load aliases
# --------------------------------------------------
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# --------------------------------------------------
# Include local bash settings
# --------------------------------------------------
if [ -f ~/.bashrc_local ]; then . ~/.bashrc_local; fi

# --------------------------------------------------
# Start desktop environment
# --------------------------------------------------
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

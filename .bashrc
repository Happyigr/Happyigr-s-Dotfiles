# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

[[ $- == *i* ]] && source -- "$HOME/.local/share/blesh/ble.sh" --attach=none

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

### History
HISTSIZE=10000
HISTFILE=~/.bash_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rm='trash-put'

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# for air formatter
. "$HOME/.local/share/../bin/env"

set -h

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/popich/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/popich/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/popich/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/popich/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ ! ${BLE_VERSION-} ]] || ble-attach

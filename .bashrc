# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

[[ $- == *i* ]] && source -- "$HOME/.local/share/blesh/ble.sh" --attach=none

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

export PATH="~/Apps/bin:$PATH"

### History
HISTSIZE=10000
HISTFILE=~/.bash_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

unalias z 2>/dev/null || true
unset -f z 2>/dev/null || true

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rm='trash-put'
alias conda='lazy_conda_init'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

set -h 

lazy_conda_init() {
    if ! type __conda_initialized &>/dev/null; then
        source $HOME/.miniconda3/etc/profile.d/conda.sh
        conda activate base 2> /dev/null
        alias __conda_initialized=true
    fi
    $HOME/.miniconda3/bin/conda "$@"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/popich_omarchy/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/popich_omarchy/.miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/popich_omarchy/.miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/popich_omarchy/.miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# for air formatter
. "$HOME/.local/share/../bin/env"

[[ ! ${BLE_VERSION-} ]] || ble-attach

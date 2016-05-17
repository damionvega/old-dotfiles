# Source aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR=nvim

export PRIVATE_KEY="$HOME/.ssh/id_rsa"

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Fuck
eval "$(thefuck --alias fuck)"

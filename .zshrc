# Path to your oh-my-zsh installation.
export ZSH=/home/clyde/.oh-my-zsh

ZSH_THEME="geometry/geometry"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

ANTIGEN_PATH=~/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle vi-mode
antigen bundle zsh-users/zsh-completions
antigen bundle kube-ps1

antigen theme robbyrussell

antigen apply

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

PROMPT=$PROMPT"\$(kube_ps1) "
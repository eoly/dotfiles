# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User specific environment
export PATH="$HOME/.local/bin:$HOME/bin:/opt/homebrew/bin:/snap/bin:/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

ANTIGEN_PATH=~/.dotfiles
source $ANTIGEN_PATH/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle vi-mode
antigen bundle zsh-users/zsh-completions
antigen bundle kube-ps1

#antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

antigen apply

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.lce_aliases ]; then
. ~/.lce_aliases
fi

PROMPT=$PROMPT"\$(kube_ps1) "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

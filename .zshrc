neofetch

# Starship
eval "$(starship init zsh)"

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

# ZSH_DISABLE_COMPFIX="true"

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nico/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nico/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nico/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nico/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Alias
alias ls='lsd'

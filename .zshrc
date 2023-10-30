neofetch

# Starship
eval "$(starship init zsh)"

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# # Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


alias add='git add'
alias branch='git branch'
alias cat='bat --theme OneHalfDark'
alias checkout='git checkout'
alias commit='git commit'
alias diff='git diff'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias java11='export JAVA_HOME=/usr/local/opt/openjdk@11 && mvn -v'
alias java17='export JAVA_HOME=/usr/local/opt/openjdk@17 && mvn -v'
alias ls=lsd
alias push='git push'
alias renv=./renv.sh
alias renv_build='source renv.sh build'
alias rufus-app='cd ~/LocalDocs/GitHub/rufus-app'
alias rufus-stats='cd ~/LocalDocs/GitHub/rufus-stats'
alias run-help=man
alias status='git status'
alias uni='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/TU_Dublin'
alias zshrc='nvim ~/.zshrc'
alias obsidian-sync='sh ~/Documents/Github/utilities/obsidian_sync.bash'
alias vim=nvim 
alias c=clear
alias e=exit


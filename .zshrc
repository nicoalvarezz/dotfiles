neofetch

# Starship
eval "$(starship init zsh)"

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

# ZSH_DISABLE_COMPFIX="true"

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Shortcuts
alias deltaload='cd ~/LocalDocs/GitHub/deltaload'
alias rufus-stats='cd ~/LocalDocs/GitHub/rufus-stats'
alias rufus-app='cd ~/LocalDocs/GitHub/rufus-app'
alias renv='./renv.sh'
alias renv_build='source renv.sh build'

# iCloud shortcuts
alias uni='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/TU_Dublin'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias hive='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/TU_Dublin/Year_4/FYP/hive'

# Commands
alias ls='lsd'
alias java11='export JAVA_HOME=/usr/local/opt/openjdk@11 && mvn -v'
alias java17='export JAVA_HOME=/usr/local/opt/openjdk@17 && mvn -v'

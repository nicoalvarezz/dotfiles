neofetch

# Starship
eval "$(starship init zsh)"

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# # Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


alias cat='bat --theme OneHalfDark'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias java11='export JAVA_HOME=/usr/local/opt/openjdk@11 && mvn -v'
alias java17='export JAVA_HOME=/usr/local/opt/openjdk@17 && mvn -v'
alias ls=lsd
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

# git aliases
alias ga='git add .' # git add all files
alias gbd='git branch -D' # branch delet 
alias gb='git branch'
alias diff='git diff'
alias gpl='git pull origin $(git branch --show-current)' # pull from current branch
alias gck='git checkout' # checkout to existing branch
alias gckb='git checkout -b' # checkout to a new branch

alias gps='git_push_with_branch_check'
git_push_with_branch_check() {
  branch_name=$(git branch --show-current)

  if [[ $branch_name == "master" || $branch_name == "devel" || $branch_name == "main" ]] then
    echo "you cannot push to master/devel branch! You want to break prod?"
  else
    git push origin $branch_name
  fi
}

alias gc='git_commit_with_branch'
git_commit_with_branch() {
  branch_name=$(git branch --show-current)
  commit_message="$branch_name $*"
  git commit -m "$commit_message"
}

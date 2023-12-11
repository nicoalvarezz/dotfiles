neofetch

# Starship
eval "$(starship init zsh)"

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# # Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Category: Java Env
alias java11='export JAVA_HOME=/usr/local/opt/openjdk@11 && mvn -v'
alias java17='export JAVA_HOME=/usr/local/opt/openjdk@17 && mvn -v'

# Category: Utilities
alias cat='bat --theme OneHalfDark'
alias ls=lsd
alias status='git status'
alias zshrc='nvim ~/.zshrc'
alias vim=nvim 

# Category: Git 
alias ga='git add .' # git add all files
alias gbd='git branch -D' # branch delet 
alias gb='git branch'
alias diff='git diff'
alias gpl='git pull origin $(git branch --show-current)' # pull from current branch
alias gco='git checkout' # checkout to existing branch
alias gcob='git checkout -b' # checkout to a new branch
alias s='git status'

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

# Category: Tmux
alias tska='tmux kill-ses -a' # kill al sessions but current

alias tkill='tmux-killer'

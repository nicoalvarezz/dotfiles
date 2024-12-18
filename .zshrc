# -------- NEOFETCH -------- 

neofetch

# -------- STARSHIPT -------- 

eval "$(starship init zsh)"

# -------- ZSH_UTILITIES -------- 

# export ~/bin with custom scripts to the PATH so they can be executed anywhere out of the box
export PATH=$PATH:~/bin

ZSH_DISABLE_COMPFIX="true"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# -------- JAVA -------- 

alias java11='export JAVA_HOME=/usr/local/opt/ok@11 && mvn -v'
alias java17='export JAVA_HOME=/opt/homebrew/opt/openjdk@17 && mvn -v'
alias java21='export JAVA_HOME=/opt/homebrew/opt/openjdk@21 && mvn -v'

# -------- FZF -------- 

# Set up fzf and fuzzy completion
eval "$(fzf --zsh)"

# Catpuccini Mocha theme for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# Use fd instead of find for fzf

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# -------- BAT -------- 

export BAT_THEME="Catppuccin Mocha"

# -------- EZA -------- 

alias ls="eza --oneline --all --git --git-ignore --color=always --icons=always"

# -------- THEFUCK -------- 

eval $(thefuck --alias)
eval $(thefuck --alias fk)

# -------- ALIASES -------- 

alias zshrc='nvim ~/.zshrc'
alias vim=nvim 

# -------- GIT -------- 

alias ga='git add'
alias gb='git branch'
alias diff='git diff'
alias gco='git checkout' # checkout to existing branch
alias gcob='git checkout -b' # checkout to a new branch
alias gs='git status'
alias gc='_git_commit_with_branch_name'
alias gps='_git_push'
alias rebase='_git_rebase'

_git_push() {
  branch_name=$(git branch --show-current)

  # Check that push is not happening in any of the protected branches
  if [[ $branch_name == "master" || $branch_name == "devel" || $branch_name == "main" ]] then
    echo "you cannot push to master/devel branch! You want to break prod?"
  else
    git push origin $branch_name
  fi
}

_git_commit_with_branch_name() {
  branch_name=$(git branch --show-current)
  commit_message="$branch_name $*"
  git commit -m "$commit_message"
}

_git_rebase() {
    branch_name=$(git branch --show-current)
    git pull origin "$branch_name" --rebase 
}

# -------- DIRS -------- 

alias ..="cd .."

# -------- TMUX -------- 

alias tska='tmux kill-ses -a' # kill all sessions but current
alias tkill='tmux-killer'


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
  vi-mode
  history-substring-search
  git-open
)

source $ZSH/oh-my-zsh.sh

# aliases
alias myblog='bundle exec jekyll server --watch --baseurl ""'
alias ls='ls -lGFh'
function cd {
    builtin cd "$@" && ls -F
}

# git alias
alias gac="git add . && git commit -m"
alias glg="git lg2"
alias glg2="git lg1"
alias gpush="git push"
alias gp='git push origin "$(git_current_branch)"'
alias go='git open'
alias gpull="git pull"
alias gc="git co"
alias gb="git branch"
alias gs="git status"
alias gcb="git co -b"
alias gcb="git co -b"


#function MCInitVimLocally {
#  source $MYCONFIG_VIM_INIT
#j  ls $LOCALCONFIG_VIM
#  ls $LOCALCONFIG_VIM_BASIC
#}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls

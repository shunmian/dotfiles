export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
  git
  vi-mode
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# aliases
alias myblog='bundle exec jekyll server --watch --baseurl ""'
alias ls='ls -lGFh'
function cd {
    builtin cd "$@" && ls -F
}
#function MCInitVimLocally {
#  source $MYCONFIG_VIM_INIT
#j  ls $LOCALCONFIG_VIM
#  ls $LOCALCONFIG_VIM_BASIC
#}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls

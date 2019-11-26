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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls

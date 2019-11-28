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
if [ -d "$ZSH_CUSTOM/plugins/git-open" ]; then
else
  git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

fi
alias gac="git add . && git commit -m"
alias gaca="git add . && git commit --amend"
alias glg="git lg2"
alias glg2="git lg1"
alias gpush="git push"
alias gp='git push origin "$(git_current_branch)"'
alias go='git open'
alias gpull="git pull"
alias gb="git branch"
alias gs="git status"
alias gf="git fetch"
alias gc="git co"
alias gd="git diff"
alias grh="git reset --hard"
alias gcb="git co -b"

if which trash >/dev/null; then
    # echo "trash exists"
else
    echo " trash does not exist"
    npm install --global trash-cli
fi
alias rm=trash

export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls

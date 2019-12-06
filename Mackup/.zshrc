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
alias gsh="git stash"
alias gf="git fetch"
alias gc="git co"
alias gd="git diff"
alias grh="git reset --hard"
alias gcb="git co -b"
alias gcp="git rev=parse"

if which trash >/dev/null; then
    # echo "trash exists"
else
    echo " trash does not exist"
    npm install --global trash-cli
fi

# install spacemacs
if [ -d "$HOME/.emacs.d" ]; then
  # echo ".emacs.d exists"
else
    echo " .emacs.d does not exist"
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
    # git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
fi

alias rm=trash
prompt_context() {}
export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

source $(brew --prefix nvm)/nvm.sh
nvm use --delete-prefix v10.13.0

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/shunmian/Desktop/gini-app/node_modules/tabtab/.completions/slss.zsh

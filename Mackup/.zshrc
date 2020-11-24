source ~/.bash_profile
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
alias sort='du -sh * | sort -r -n | head -30 | tail -10'

# git alias
if [ -d "$ZSH_CUSTOM/plugins/git-open" ]; then
else
  git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

fi
alias glg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)    %C(bold yellow)%d%C(reset)' --all"
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias glg="glg2"
alias gco="git checkout"
alias gac="git add . && git commit -m"
alias gaca="git add . && git commit --amend"
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
alias gcp="git rev-parse"

alias imgSize="rdjpgcom -verbose"

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

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# For Linux
# swap caps and ctrl key
# setxkbmap -option ctrl:swapcaps
# alias open
# alias open='nautilus'
#
# export PATH="$HOME/anaconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lal/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
   eval "$__conda_setup"
else
   if [ -f "/Users/lal/anaconda3/etc/profile.d/conda.sh" ]; then
      . "/Users/lal/anaconda3/etc/profile.d/conda.sh"
   else
       export PATH="/Users/lal/anaconda3/bin:$PATH"
   fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<


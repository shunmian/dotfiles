

# source ~/.bash_profile
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


alias rm=trash
prompt_context() {}
export LSCOLORS=exfxfeaeBxxehehbadacea # colourful ls
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

# For Linux
# swap caps and ctrl key
setxkbmap -option ctrl:swapcaps
# alias open
alias open='nautilus'
#
# export PATH="$HOME/anaconda3/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which trash >/dev/null; then
    # echo "trash exists"
else
    echo " trash does not exist"
    npm install --global trash-cli
fi


export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node/
export NVM_IOJS_ORG_MIRROR=http://npm.taobao.org/mirrors/iojs


if [ -d "/usr/local/cuda/bin/" ]; then

export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

fi

alias up='unset https_proxy http_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zwhs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zwhs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zwhs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zwhs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(direnv hook zsh)"
export PATH=$PATH:/nix/var/nix/profiles/default/bin/

alias op="cd ~/Downloads/Clash\ for\ Windows-0.20.39-x64-linux && ./cfw"
alias zg="cd "/home/zwhs/zwhs/zdetect/global/js/src/defect-system/OCS/raw/DataCenter" && node invoke.js && cd "/home/zwhs/zwhs/zdetect/global/js/src/defect-system/OCS/raw" && node convert.js && cd "/home/zwhs/zwhs/zdetect/global/js/src/defect-system/tools/converter/dfsSeed2dfs" && node invoke.js && cd "/home/zwhs/zwhs/zdetect/global/js/src/defect-system/tools/converter/dfs2processing" && node invoke.js"

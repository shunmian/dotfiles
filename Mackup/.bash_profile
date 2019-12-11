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

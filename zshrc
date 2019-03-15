bindkey -e

source ~/.secrets
source ~/.profile

# ASDF
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dmitrijsvecov/.npm/_npx/97826/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dmitrijsvecov/.npm/_npx/97826/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
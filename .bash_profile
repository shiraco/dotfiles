#rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV/shims:$PATH"
eval "$(rbenv init -)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#global
export EDITOR='subl'

export LANG=ja_JP.UTF-8

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export PATH=/usr/local/bin:$PATH

# alias
alias py='python'
alias bex='bundle exec'
function gi() { curl http://www.gitignore.io/api/$@ ;}

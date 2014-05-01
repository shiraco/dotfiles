# global
export EDITOR='vim'
export LANG=ja_JP.UTF-8

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# alias
alias py='python'
alias bex='bundle exec'

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

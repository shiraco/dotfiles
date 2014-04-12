#global
export PATH=/usr/local/bin:$PATH

#export EDITOR='subl'

export LANG=ja_JP.UTF-8

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

#rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# alias
alias py='python'
alias bex='bundle exec'

function gi() { curl http://www.gitignore.io/api/$@ ;}

#scala
SCALA_HOME=/usr/local/Cellar/scala/2.10.3
export SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin


# httpd
export PATH=/usr/local/Cellar/httpd/2.2.27/sbin:$PATH

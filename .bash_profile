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

# Julia
export PATH=$PATH:/Applications/Julia-0.3.0.app/Contents/Resources/julia/bin

# Octave
export PATH=$PATH:/usr/local/octave/3.8.0/bin
alias octave='octave-3.8.0'
export GNUTERM=aqua

# gitignore
function gi() { curl -s https://www.gitignore.io/api/$@ ;}

##
# Your previous /Users/shiraishi/.bash_profile file was backed up as /Users/shiraishi/.bash_profile.macports-saved_2015-01-07_at_20:30:56
##

# MacPorts Installer addition on 2015-01-07_at_20:30:56: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# docker
export DOCKER_HOST=tcp://localhost:4243

# LightTable
export PATH=$PATH:/Applications/LightTable

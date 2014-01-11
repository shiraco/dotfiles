#rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

#subl
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

#global
export EDITOR='subl'

export TERM=vt100-color
export LANG=ja_JP.UTF8

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

#rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

#subl
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

#global
export EDITOR='subl'

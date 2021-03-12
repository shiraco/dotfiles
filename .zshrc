# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export TZ=Asia/Tokyo
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/lib
export GREP_OPTIONS='--color=auto'
export EDITOR='vim'

: "Setting Proxy" && {
    if [ -f "${HOME}/.switch_proxy" ]; then
        alias nswitch="source ${HOME}/.switch_proxy"
    fi
    if [ -f "${HOME}/.switch_location" ]; then
        alias lswitch="source ${HOME}/.switch_location"
    fi
}

: "Setting Network" && {
    alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
    alias wifioff='networksetup -setairportpower en0 off'
    alias wifion='networksetup -setairportpower en0 on'
    alias wifils="airport -s | awk 'NR > 1 {print `$1`}'"

    if [[ -x `which peco` ]]; then
        alias chwifi='wifils | peco --prompt "Select wifi network env:" | xargs scselect'
        alias nwl='scselect | sed -e 1d -e "s/[^(]*(\(.*\))/\1/g" | peco --prompt "Select network location env:" | xargs scselect'
    fi
}

: "Setting Git" && {
    # .gitignore
    function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

    ## hubコマンド
    if [ -x "`which hub`" ]; then
        eval "$(hub alias -s)"
    fi
}

: "Setting Direnv" && {
    ## direnv
    if [ -x "`which direnv`" ]; then
        eval "$(direnv hook zsh)"
    fi
}

: "Setting Ruby" && {
    ## rbenv
    export RBENV_ROOT="${HOME}/.rbenv"
    if [ -d "${RBENV_ROOT}" ]; then
        export PATH="${RBENV_ROOT}/bin:${PATH}"
        eval "$(rbenv init -)"
    fi

    # alias
    alias bex='bundle exec'
}

: "Setting Python" && {
    ## pyenv
    export PYENV_ROOT="${HOME}/.pyenv"
    if [ -d "${PYENV_ROOT}" ]; then
        export PATH="${PYENV_ROOT}/bin:${PATH}"
        eval "$(pyenv init -)"
    fi

    # alias
    alias py='python'
    alias pireq='pip install -r requirements.txt'
    alias pifre='pip freeze > requirements.txt'

    # virtualenv
    function venv() {
        PWD_FOR_VE_CREATE=`pwd`
        virtualenv ./.venv --prompt='('`basename ${PWD_FOR_VE_CREATE}`')'
        pip install --upgrade pip
    }

    # ディレクトリへ移動したらchpwdが呼ばれる
    function vactivate() {
        if [ -d ".venv" ]; then
            source .venv/bin/activate
        fi
    }
    # autoload -Uz add-zsh-hook
    # add-zsh-hook chpwd vactivate

    # 読み込み時にも実行
    # vactivate

    # direnv for virtualenv
    show_virtual_env() {
        if [ -n "$VIRTUAL_ENV" ]; then
            echo "(virtualenv)"
        fi
    }

    PS1='$(show_virtual_env)'$PS1
}

: "Settings Go" && {
    if [ -x "`which go`" ]; then
        export GOROOT=`go env GOROOT`
        export GOPATH=${HOME}/code/go-local
        export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin
    fi
}

: "Setting Heroku" && {
    # heroku
    alias herokuenv="heroku config | awk 'NR > 1 {print $1$2}' | sed -e 's/:/=/'"
}

: "Setting Travis" && {
    # added by travis gem
    [ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
}

: "Setting Postgre" && {
    # PostgreSQL設定（DBの置き場所）
    export PGDATA=/usr/local/var/postgres
}
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# http://dqn.sakusakutto.jp/2014/10/emacs_shell_iterm2_zsh.html
DISABLE_AUTO_TITLE="true"

function reprompt() {
    # プロンプト
    # 1行表示
    PROMPT="%~ %# "
    # 2行表示
    # PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
    # %# "
}
reprompt

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする

#for zsh-completions
fpath=(/usr/local/share/zsh-completions ${fpath})

autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=ja_JP.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# zsh: no matches found がでないようにする
setopt nonomatch

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
bindkey -e

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# colordiff
if [[ -x `which colordiff` ]]; then
    alias diff='colordiff'
else
    alias diff='diff'
fi

# less
export LESS='-R'

nswitch



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        # Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'

        # Mac App
        alias firefox="open -a Firefox"
        alias safari="open -a Safari"
        alias chrome="open /Applications/Google\ Chrome.app"

        #関数定義(引数3つ)
        tab-color() {
            echo -ne "\033]6;1;bg;red;brightness;$1\a"
            echo -ne "\033]6;1;bg;green;brightness;$2\a"
            echo -ne "\033]6;1;bg;blue;brightness;$3\a"
        }

        tab-reset() {
            echo -ne "\033]6;1;bg;*;default\a"
        }

        function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}
        alias top='tab-color 134 200 0; top; tab-reset'
        ;;

    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac
export PATH="/usr/local/sbin:$PATH"

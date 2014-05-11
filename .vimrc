" http://vimblog.hatenablog.com/entry/vimrc_set_recommended_options

" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" 画面表示の設定

syntax on          " 色づけをオン
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set ruler          " 画面最下行にルーラーを表示する
set wrap           " ウィンドウの幅より長い行は折り返され、次の行に続けて表示する
set wrapscan       " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ " 不可視文字の表示記号指定

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set nostartofline              " 移動コマンドを使ったとき、行頭に移動しない

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
filetype indent plugin on " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグイン有効化

" 検索/置換の設定

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

set clipboard=unnamed,unnamedplus,autoselect " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a                       " マウスの入力を受け付ける

" コマンドラインの設定

set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000                       " コマンドラインの履歴を10000件保存する
set showcmd                             " タイプ途中のコマンドを画面最下行に表示

" ビープの設定

set visualbell t_vb= " ビープ音すべてを無効にする
set noerrorbells     " エラーメッセージの表示時にビープを鳴らさない

" その他

set notimeout ttimeout ttimeoutlen=200 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set pastetoggle=<F11>                  " <F11>キーで'paste'と'nopaste'を切り替える<


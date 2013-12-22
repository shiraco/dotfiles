 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/vimproc'
 NeoBundle 'Shougo/unite.vim'

 " NeoSnippets
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neosnippet'

 " Added For Ruby Programming
 NeoBundle 'AndrewRadev/switch.vim'
 NeoBundle 'tpope/vim-endwise'

 filetype plugin indent on     " Required!
 NeoBundleCheck

syntax on

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set number

set nocompatible
filetype plugin indent off
" bundleで管理するディレクトリを指定
    set runtimepath+=~/.vim/bundle/neobundle.vim/
"  
"  " Required:
    call neobundle#begin(expand('~/.vim/bundle/'))
"   
"   " neobundle自体をneobundleで管理
    NeoBundleFetch 'Shougo/neobundle.vim'
    "    
    NeoBundle 'Townk/vim-autoclose'
    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'vim-scripts/vim-auto-save'

"    " 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
"     
    call neobundle#end()
"      
"      " Required:
filetype plugin indent on


" NeoBundle syntastic
let g:syntastic_javascript_checker = "jshint" "JavaScriptのSyntaxチェックはjshintで
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施

" NeoBundle autosave
" デフォルトで有効にする
 let g:auto_save = 1
"
"


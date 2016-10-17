"setting


"自分で追加
"
colorscheme hybrid
set background=dark
syntax enable

"マウス
set mouse=a
set ttymouse=xterm2
"行間移動用
set whichwrap=b,s,<,>,[,] 
"バックスペース
set backspace=indent,eol,start
"不可視文字の可視化
set list
set listchars=trail:-,nbsp:%,eol:↲
"タブ生成
noremap <C-T> :tabnew<CR>
"タブ移動
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor


"サイト参考
"
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

set tabline=%!MyTabLine()
 
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
 
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
 
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
 
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
 
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XClose'
  endif
 
  return s
endfunction
 
let g:use_Powerline_dividers = 1
 
function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let altbuf = bufname(buflist[winnr - 1])
 
    " $HOME を消す
    let altbuf = substitute(altbuf, expand('$HOME/'), '', '')
 
    " カレントタブ以外はパスを短くする
    if tabpagenr() != a:n
        let altbuf = substitute(altbuf, '^.*/', '', '')
        let altbuf = substitute(altbuf, '^.\zs.*\ze\.[^.]\+$', '', '')
    endif
 
    " vim-powerline のグリフを使う
    if g:use_Powerline_dividers
        let dividers = g:Pl#Parser#Symbols[g:Powerline_symbols].dividers
        let left_div = nr2char(get(dividers[3], 0, 124))
        let right_div = nr2char(get(dividers[1], 0, 124))
        let altbuf = left_div . altbuf . right_div
    else
        let altbuf = '|' . altbuf . '|'
    endif
 
    " タブ番号を付加
    let altbuf = a:n . ':' . altbuf
 
    return altbuf
endfunction


"vimrc に以下のように追記

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/dein')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite file file/new directory/new<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
 
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
    " Overwrite settings.
endfunction
 
" 様々なショートカット
call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/"')
call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
call unite#custom#substitute('file', '\\ \@!', '/', -30)
 
if has('win32') || has('win64')
    call unite#custom#substitute('file', '^;p', 'C:/Program Files/')
    call unite#custom#substitute('file', '^;v', '~/vimfiles/')
else
    call unite#custom#substitute('file', '^;v', '~/.vim/')
endif

noremap <C-G> :Gstatus<CR>

filetype plugin indent on

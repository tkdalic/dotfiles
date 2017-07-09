" <F5>で編集中のファイルを実行
" MATLABと同じショートカット "
set noexpandtab
set tabstop=4
set shiftwidth=4

" 実行と整形
noremap <F5> :GoRun<ENTER>
noremap <F7> :GoImports<ENTER>:GoFmt<ENTER>

"自動コードスタイルチェック
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

"i補完設定
let g:go_gocode_unimported_packages = 1
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

"補完の詳細を表示しない
set completeopt=menu

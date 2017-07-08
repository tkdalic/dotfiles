" <F5>で編集中のファイルを実行
" MATLABと同じショートカット
"
set noexpandtab
set tabstop=4
set shiftwidth=2

noremap <F5> :GoRun<ENTER>
noremap <F7> :GoImports<ENTER>:GoFmt<ENTER>

let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

let g:go_gocode_unimported_packages = 1

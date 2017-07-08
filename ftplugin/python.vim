" <F5>で編集中のファイルを実行
" MATLABと同じショートカット

noremap <F5> :call EXEC_SCRIPT()<ENTER>
function! EXEC_SCRIPT()
    :!echo "====================";python %;echo "===================="
endfunction

"F7で自動修正
noremap <F7> :call Autopep8()<CR>
"diff画面の非表示
let g:autopep8_disable_show_diff=1

"コードチェック
let g:syntastic_python_checkers = ["flake8"]

"------------------------------------------------------------
" jedi-vim Setting

setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"-----------------------------------------------------------

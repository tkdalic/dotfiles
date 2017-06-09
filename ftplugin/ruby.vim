" <F5>で編集中のファイルを実行
" MATLABと同じショートカット

noremap <F5> :call EXEC_SCRIPT()<ENTER>
function! EXEC_SCRIPT()
    :!echo "====================";ruby %;echo "===================="
endfunction

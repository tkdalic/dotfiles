" <F5>で編集中のファイルを実行
" MATLABと同じショートカット

noremap <F5> :call EXEC_SCRIPT()<ENTER>
function! EXEC_SCRIPT()
    :!echo "====================";python3 %;echo "===================="
endfunction


function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

"F7で自動修正
noremap <F7> :call Autopep8()<CR>

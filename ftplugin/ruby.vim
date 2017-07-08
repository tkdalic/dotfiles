" <F5>で編集中のファイルを実行
" MATLABと同じショートカット
"
setlocal tabstop=2 shiftwidth=2 softtabstop=2

noremap <F5> :call EXEC_SCRIPT()<ENTER>
function! EXEC_SCRIPT()
    :!echo "====================";ruby %;echo "===================="
endfunction

" 補完の設定
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

let g:rsenseUseOmniFunc = 1

let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }

let g:rsenseHome = expand('/usr/local/lib/rsense')

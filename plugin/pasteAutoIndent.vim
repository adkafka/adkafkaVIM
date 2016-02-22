" File: pasteAutoIndent.vim
" Author: Adam Kafka
" Description: Pastes and indents code using =
" Last Modified: May 26, 2015
"nnoremap p :call <SID>PasteAndIndent('p')<CR>
"nnoremap P :call <SID>PasteAndIndent('P')<CR>
" Note: SID inserts scrpit id. Make it not glbal. :help <SID> for more

function! s:PasteAndIndent(pasteCommand)
    let beg_line = line(".") "Line # where we start
    "Paste using appropriate register
    execute "normal! \"".v:register.a:pasteCommand
    let end_line = line(".") "Line # where we end
    "Go to beg, indent til end, then go to end
    execute "normal! ".beg_line."G=".end_line."G".end_line."G"
endfunction

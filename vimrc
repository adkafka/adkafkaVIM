" Things to add:
" %s:/\*\([A-z]\):/\* \1:g  
" %s://\([A-z]\):// \1:g  
""""""""""

"SETTINGS
""""""""""

"Set snippet author
let snips_author = "Adam Kafka"

"Load pathogen
execute pathogen#infect()

"Set my Leader
let mapleader = "\\"

"Turn Syntax on
syntax on

"Word wrapping
set wrap
set nolist
set linebreak

"Tab stuff
set tabstop=4
set shiftwidth=4
set expandtab

"Turn Auto-indent and smart indent
set autoindent smartindent
set smarttab
      
"Set tab auto completion for editing files
set wildmenu
set wildmode=list:longest,full

"Turn on visual bell instead of beep
set visualbell

"Time between key commands (ms)
set timeoutlen=500

"Search stuff
set incsearch "searches as you type
set ignorecase "Ignore case when searhcing
set smartcase "Wont ignore if searching for Smart because first letter is capital
set hlsearch "Highlight search results

"Set filtype plugin for SnipMate
filetype plugin on
filetype indent on "Not needed but will be later prolly

"Turn off bakups and swap files etc
set backupdir=~/.vim/backups  "files sent here 
set noswapfile "Dont use swap files

"Show line numbers
set number

"Disable autocommenting when using o/O. :help fo-table to see other options
set formatoptions-=o
 
"Disable folding
set nofoldenable

"Set up a dictionary
set dictionary=/usr/share/dict/words

"Statusline in .vim/plugin/statusline.vim

"Load Global syntax
augroup global
    autocmd!
    autocmd BufRead,BufNewFile * source ~/.vim/syntax/global.vim
augroup END
"php and html filetype
augroup phpAndHtml
    autocmd!
    autocmd BufRead,BufNewFile *.php set ft=php.html
augroup END
" markdown extension TODO, move this to ftdetect
augroup Markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

" In the quickfix window, <CR> is used to jump to the entry under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"Mappings for dragvisuals plugin
vnoremap  <expr>  <LEFT>        DVB_Drag('left')
vnoremap  <expr>  <RIGHT>        DVB_Drag('right')
vnoremap  <expr>  <UP>        DVB_Drag('down')
vnoremap  <expr>  <DOWN>        DVB_Drag('up')


"""""""""
"MAPPINGS
"""""""""
"Move the screen (not cursor) with the arrow keys
nnoremap <Down> <C-E>
nnoremap <Up> <C-Y>
nnoremap <LEFT> zh
nnoremap <RIGHT> zl

nnoremap Y y$
nnoremap cb bcw
nnoremap cB BcW
nnoremap gh <C-]>

nnoremap <ENTER> o<Esc>
nnoremap <S-Enter> O<Esc>

nnoremap <silent> <C-S> :source ~/.vimrc<CR>:call ReloadAllSnippets()<CR>
nnoremap <C-Down> }
nnoremap <C-Up> {

"Leader maps
nnoremap <silent> <Leader><Leader> :let @/ = ""<CR>
nnoremap <silent> <Leader>all :tab sball<CR>
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
"Insert filename
inoremap <Leader>fn <C-R>=expand("%:t")<CR>
"Get to snippets
noremap <Leader>snip :e ~/.vim/snippets/<CR>
"Edit vimrc
noremap <Leader>rc :e ~/.vimrc<CR>
"cd to curent dir
nnoremap <Leader>cd :lcd %:h<CR>:pwd<CR>

"Switch v and ctrl-v
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v
"Switch ; and :
nnoremap  ;  :
nnoremap  :  ;
vnoremap  ;  :
vnoremap  :  ;

"Run on all visual lines
vnoremap . :normal .<CR>
"Macros on every viusual line
vnoremap  @  :normal @

"Switch windows easily
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

"Display registedrs and diable normal Q functionality
nnoremap Q :reg<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
"cnoremap <ESC>b     <S-Left>
"cnoremap <ESC><C-B> <S-Left>
"cnoremap <ESC>f     <S-Right>
"cnoremap <ESC><C-F> <S-Right>
"cnoremap <ESC><C-H> <C-W>

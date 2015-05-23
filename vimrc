" Things to add:
" %s:/\*\([A-z]\):/\* \1:g  
" %s://\([A-z]\):// \1:g  
""""""""""

"SETTINGS
""""""""""

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

"Line number
set number

"Turn off auto commenting
set comments-=:// 
 
"Disable folding
set nofoldenable

"Set up a dictionary
set dictionary=/usr/share/dict/words

"Statusline in .vim/plugin/statusline.vim

"snipmate mutiple snippets
autocmd BufRead *.php set ft=php.html
autocmd BufNewFile *.php set ft=php.html
" markdown extension
autocmd BufRead,BufNewFile *.md set filetype=markdown

"Mappings for dragvisuals plugin
vnoremap  <expr>  h        DVB_Drag('left')
vnoremap  <expr>  l        DVB_Drag('right')
vnoremap  <expr>  j        DVB_Drag('down')
vnoremap  <expr>  k        DVB_Drag('up')


"""""""""
"MAPPINGS
"""""""""
noremap Y y$
noremap <silent> <Leader>all :tab sball<CR>
noremap <ENTER> o<Esc>
noremap <S-Enter> O<Esc>
noremap <silent> <C-S> :source ~/.vimrc<CR>:call ReloadAllSnippets()<CR>
noremap <silent> <Leader><Leader> :let @/ = ""<CR>
nnoremap <C-Down> }
nnoremap <C-Up> {
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
nnoremap cb bcw
nnoremap cB BcW
"nmap p p==
"nmap P P==
"nmap p [p  "Auto indent paste
"nmap P [P

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

"Move the screen up and down
noremap <S-Down> <C-E>
noremap <S-Up> <C-Y>

"Switch windows easily
noremap <C-J> <C-W>j<C-W>
noremap <C-K> <C-W>k<C-W>

"Insert filename
inoremap <Leader>fn <C-R>=expand("%:t")<CR>

"Get to snippets
noremap <Leader>snip :e ~/.vim/snippets/<CR>

"Edit vimrc
noremap <Leader>rc :e ~/.vimrc<CR>

"cd to cuurent dir
nnoremap <silent> <Leader>cd :lcd %:h<CR>

"Display registedrs
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

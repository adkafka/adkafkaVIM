" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Run :PlugInstall to install all plugins

Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

"Set NERDTree settings
let NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 't'}, 'dir': {}} "Open files in new tab

"Set netrw file browser settings
let g:netrw_banner = 0 "disable help
let g:netrw_liststyle = 3 "tree browser
let g:netrw_browse_split = 3 "open new file in new tab
let g:netrw_winsize = 25 "take up 25% of the page

"Disable nvim markdown styling
let g:markdown_recommended_style = 0

"Set my Leader as \ (Backslash)
let mapleader = "\\"
let localleader = "\\"

"Login to the bash shell
let &shell='/usr/local/bin/bash --login'

"Turn Syntax on
syntax on

"Disable stupid neovim mouse mode
set mouse=

"Use light background
set background=light

"Word wrapping
set wrap
set nolist
set linebreak

"Tab stuff
set tabstop=2
set softtabstop=-1 "Use shiftwidth
set shiftwidth=2
set expandtab

"Turn Auto-indent and smart indent
set autoindent smartindent
      
"Set tab auto completion for editing files
set wildmenu
set wildmode=list:longest,full
"Recommend options using tab in command mode
set smarttab

"Turn on visual bell instead of beep
set visualbell

"Time between key commands (ms)
set timeoutlen=500

"Search stuff
set incsearch "searches as you type
set ignorecase "Ignore case when searhcing
set smartcase "Wont ignore if searching for Smart because first letter is capital
set hlsearch "Highlight search results

"Turn off backups and swap files etc
set backupdir=~/.vim/backups  "files sent here 
set noswapfile "Dont use swap files

"Show line numbers
set number

"Don't change EOL behavior
set nofixendofline

"Disable autocommenting when using o/O. :help fo-table to see other options
set formatoptions-=o
 
"Disable folding
set nofoldenable

"Set up a dictionary
set dictionary=/usr/share/dict/words

"Update the dictionary index
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'silent mkspell! ' . fnameescape(d)
    endif
endfor

"Statusline in .vim/plugin/statusline.vim

""""""""""""""
"Autocommands"
""""""""""""""
"Don't expand tabs on makefiles
augroup make
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END
"Don't expand tabs on golang
augroup golang
    autocmd!
    autocmd FileType go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
augroup END
"Load Global syntax
augroup global
    autocmd!
    autocmd BufRead,BufNewFile * source ~/.vim/syntax/global.vim
augroup END
" Spell check on Markdown
augroup markdown
  autocmd!
  autocmd FileType markdown setlocal spell
augroup END
" Spell check on Git Commit
augroup git
  autocmd!
  autocmd FileType gitcommit setlocal spell
augroup END
if has("nvim")
  " Don't use line numbers in terminal mode
  augroup TerminalStuff
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
  augroup END
endif


""""""""""
"MAPPINGS"
""""""""""
"Move the screen (not cursor) with the arrow keys
nnoremap <Down> <C-E>j
nnoremap <Up> <C-Y>k
nnoremap <LEFT> zh
nnoremap <RIGHT> zl

nnoremap Y y$
nnoremap cb bcw
nnoremap cB BcW
nnoremap gh <C-]>

" gr to previous tab
nnoremap gr gT

nnoremap L $
nnoremap H ^
vnoremap L $
vnoremap H ^

vnoremap < <gv
vnoremap > >gv

"Insert the ticket number from git
nnoremap <Leader>t :0read !git rev-parse --abbrev-ref HEAD \| sed -E 's:[a-z0-9_]*/?([A-Z]+-[0-9]+)(.*):\1:g'<CR>
"nnoremap <Leader>t :0read !git rev-parse --abbrev-ref HEAD \| sed -E 's:([a-z]+)/([A-Z]+-[0-9]+)(.*):\2:g'<CR>

"Esc things
inoremap jk <Esc>
inoremap kj <Esc>
inoremap ;w <Esc>:w<CR>
"Same thing but for neovim
if has("nvim")
	inoremap <ESC> <C-\><C-n>
  tnoremap <ESC><ESC> <C-\><C-n>
endif
"Add new blank lines in normal mode
nnoremap <ENTER> o<Esc>
nnoremap <S-Enter> O<Esc>

"Reload settings (vimrc and snippets)
nnoremap <silent> <C-S> :source ~/.vimrc<CR>

"Mapping for movements
nnoremap <C-Down> }
nnoremap <C-Up> {

"Clear search
nnoremap <silent> <Leader><Leader> :let @/ = ""<CR>

"Open all buffers in tabs
nnoremap <silent> <Leader>all :tab sball<CR>

"System yank
vnoremap <Leader>y "*y
vnoremap <Leader>Y "*Y
nnoremap <Leader>y "*y
nnoremap <Leader>Y "*Y

"System paste
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P

"Delete  to null register
nnoremap <leader>d "_d

"Edit vimrc
noremap <Leader>rc :e ~/.vimrc<CR>

"cd to curent dir
nnoremap cd :lcd %:h<CR>:pwd<CR>

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

"Display registers and diable normal Q functionality
nnoremap Q :reg<CR>

"Allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>

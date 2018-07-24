set backup     " keep a backup file (restore to previous version)
set undofile   " keep an undo file (undo changes after closing)
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands

let g:python_host_prog = '/usr/local/Cellar/python/2.7.11/bin/python'

execute pathogen#infect()

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Use comma as leader key.
let mapleader=","

" Remap ruby compiler for .rb files.
au FileType rb map <leader>r :!ruby %<cr>

" Remap go run compiler for .go files.
au FileType go map <leader>r :!go run %<cr>

" Remap go run compiler for .go files.
au FileType js map <leader>r :!node run %<cr>

" Syntax highlighting for gohtml files.
syntax on
filetype on
au BufNewFile,BufRead *.gohtml set filetype=html

" Use leader + w for shortcut to pane navigation.
map <leader>w <C-w>

" Use leader + j to check json formatting.
map <leader>j :%!python -m json.tool<cr>

" Automatically close VIM if NERDTree is the only window remaining.
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Resolving the buffer nonsense of clipboards.
set clipboard=unnamed

" Show line numbers
set number

set tabstop=2       
set shiftwidth=2    
set softtabstop=2   
set expandtab       

" disable swap files. 
set nobackup
set nowritebackup
set noswapfile

:imap jj <Esc>

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

set t_Co=256
let g:rehash256 = 1
colorscheme molokai

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
call plug#end()


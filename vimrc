" Switch off VI support
set nocompatible

" Configure pathogen
execute pathogen#infect()

" Enable 256-colors support
set t_Co=256
set background=dark

" Turn on syntax hilighting
syntax on

" Enable filetype detection
filetype on

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

" Set color scheme.
colorscheme hybrid-my

" Jump to the last position when reopen a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off cursor keys.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc settings.

set showcmd         " show (partial) command in status line.
set showmatch       " show matching brackets.
set hlsearch        " highlight searches
set nobackup        " do not keep a backup file
set ttyfast         " we have a modern terminal

set confirm         " show confirmation request instead of an error

set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab       " replace tab by spaces

set number          " show line numbers
set timeoutlen=2000 " command key timeout

set laststatus=2    " always show status line
set noruler         " turn off ruller

set incsearch       " incremental search
set scrolloff=8     " always show 8 lines when scrolling

set colorcolumn=80  " show 80-column

set exrc            " read vim settings from current folder
set secure          " read 'exrc' in a secure way

" expand %% to the folder contains the current file
cabbr <expr> %% expand('%:p:h') 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000  " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line configuration

set statusline=%02n\ %<%f%m\ %r[%{fugitive#head()}]%=Line:\ %l/%L[%p%%]\ Col:\ %3c\ [%3b]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting

augroup filetype
  au! BufRead,BufNewFile *.ll                   set filetype=llvm
  au! BufRead,BufNewFile *.td                   set filetype=tablegen
  au! BufRead,BufNewFile *.rst                  set filetype=rest
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick fix window setup

" Automatically open, but do not go to (if there are errors)
" the quickfix / location list window, or close it when is has become empty.
" TODO: Make the quicfix window active.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd Filetype gitcommit setlocal spell textwidth=72

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

" Execute the 'action' if current buffer is regular.
function RegFileAction(action)
  if &buftype == ''
    execute a:action
  endif
endfunction

" Map F9 to open/close NERDTree
map <F9> :call RegFileAction("NERDTreeToggle")<CR>

" Map Ctrl-w w to :bwipeout
map <c-w>w :bw<CR>

" Map Ctrl-p Ctrl-f to open CtrlP in file find mode
" Map Ctrl-p Ctrl-b to open CtrlP in buffer find mode
" Map Ctrl-p Ctrl-m to open CtrlP in MRU find mode
map <c-p><c-f> :CtrlP<CR>
map <c-p><c-u> :CtrlPBuffer<CR>
map <c-p><c-m> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

let g:NERDChristmasTree     = 1 " Turn on colors
let g:NERDTreeMinimalUI     = 1 " Remove help and bookmarks
let g:NERDTreeShowBookmarks = 1 " Restore bookmarks
let g:NERDTreeWinSize       = 40 " Window width

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang-format

let clang_format_fallback_style="LLVM"
map <C-I> :py3f ~/.vim/bin/clang-format.py<CR>

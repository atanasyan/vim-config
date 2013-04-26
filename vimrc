" Switch off VI support
set nocompatible

" Configure pathogen
execute pathogen#infect()

" Enable 256-colors support
set t_Co=256
set background=dark
" Set color scheme.
colorscheme desert256

" Turn on syntax hilighting
syntax on

" Enable filetype detection
filetype on

" Jump to the last position when reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc settings.

set showcmd         " show (partial) command in status line.
set showmatch       " show matching brackets.
set hlsearch        " highlight searches
set nobackup        " do not keep a backup file
set ttyfast         " we have a modern terminal

set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab       " replace tab by spaces

set nu              " show line numbers
set timeoutlen=2000 " command key timeout

set laststatus=2    " always show status line
set noruler         " turn off ruller
set statusline=%<%f%m\ %r%=Line:\ %l/%L[%p%%]\ Col:\ %3c\ [%3b]

hi StatusLine cterm=reverse ctermfg=237 ctermbg=231
hi Normal cterm=reverse ctermfg=231 ctermbg=234

set incsearch       " incremental search
set scrolloff=8     " always show 8 lines when scrolling
 
set tags=tags;/     " Set tags search rule

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files.
augroup filetype
  au! BufRead,BufNewFile *.rst    set filetype=rest
augroup END

" Enable syntax highlighting for tmux conf file.
augroup filetypedetect
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

" Map F5/F6 to switch to previous/next buffer
map <F5> :bp<CR>
map <F6> :bn<CR>

" Map F9 to open/close NERDTree
map <F9> :NERDTreeToggle<CR>

" Map F8 to open/close Tagbar
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar

let g:tagbar_left    =  1 " Show window on left
let g:tagbar_width   = 30 " Set window's width
let g:tagbar_compact =  1 " Do not show help

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

let g:NERDChristmasTree     = 1 " Turn on colors
let g:NERDTreeMinimalUI     = 1 " Remove help and bookmarks
let g:NERDTreeShowBookmarks = 1 " Restore bookmarks

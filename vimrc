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

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

" Jump to the last position when reopen a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

set nu              " show line numbers
set timeoutlen=2000 " command key timeout

set laststatus=2    " always show status line
set noruler         " turn off ruller
set statusline=%<%f%m\ %r%=Line:\ %l/%L[%p%%]\ Col:\ %3c\ [%3b]

hi StatusLine cterm=reverse ctermfg=237 ctermbg=231
hi Normal cterm=reverse ctermfg=231 ctermbg=234

set incsearch       " incremental search
set scrolloff=8     " always show 8 lines when scrolling
 
set tags=./tags;/   " Set tags search rule

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting

augroup filetype
  au! BufRead,BufNewFile *.ll                   set filetype=llvm
  au! BufRead,BufNewFile *.td                   set filetype=tablegen
  au! BufRead,BufNewFile *.rst                  set filetype=rest
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure project specific settings

augroup ProjectSetup
  au BufRead,BufEnter /home/simon/work/mclinker/git/* set makeprg=mc-bld.sh
  au BufRead,BufEnter /home/simon/work/llvm/git/*     set makeprg=clang-bld.sh
  au BufRead,BufEnter /home/simon/work/lld/git/*      set makeprg=lld-bld.sh
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick fix window setup

" Automatically open, but do not go to (if there are errors)
" the quickfix / location list window, or close it when is has become empty.
" TODO: Make the quicfix window active.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings

" Execute the 'action' if current buffer is regular.
function RegFileAction(action)
  if &buftype == ''
    execute a:action
  endif
endfunction

" Map F2 to save buffer
map <F2> :call RegFileAction("w")<CR>

" Map F5/F6 to switch to previous/next buffer
" TODO: Switch to the next regular buffer
map <F5> :call RegFileAction("bp")<CR>
map <F6> :call RegFileAction("bn")<CR>

" Map F8 to open/close Tagbar
map <F8> :call RegFileAction("TagbarToggle")<CR>

" Map F9 to open/close NERDTree
map <F9> :call RegFileAction("NERDTreeToggle")<CR>

" Map Ctrl-w w to :bwipeout
map <c-w>w :bw<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang_complete https://github.com/Rip-Rip/clang_complete

set completeopt = "menuone"
set pumheight=10
let g:clang_library_path  = "/home/simon/work/llvm/stable/lib"
let g:clang_complete_auto = 0
let g:clang_close_preview = 1

highlight Pmenu ctermfg=red ctermbg=white
"highlight PmenuSel ctermfg=white ctermbg=blue

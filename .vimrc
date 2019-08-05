execute pathogen#infect()

let g:monochrome_italic_comments = 1
colorscheme monochrome

filetype plugin indent on
syntax on
let NERDTreeShowHidden=1
set laststatus=2
set backspace=indent,eol,start

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

set rtp+=~/.fzf

" NERDtree on start
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" switch back to file
" autocmd VimEnter * wincmd p

" CTRL-SPACE is autosuggest

" NERDtree map
map <C-b> :NERDTreeToggle<CR>
map <C-n> :term<CR>

set number
set splitbelow

set mouse=a

" since we are using CUA mode, remap CONTROL-S
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" autoread and display outside changes from commands 
set autoread

" enter/exit buffer save and reload
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

au CursorHold,CursorHoldI * checktime


call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" Line numbering style (duh)
set number
set relativenumber

set nocompatible
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Add nice scrolling when using `j' and `k'
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" 4 space soft tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

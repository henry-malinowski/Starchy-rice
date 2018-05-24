call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'micha/vim-colors-solarized'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

syntax enable
set number
set relativenumber
set cursorline
set history=64
set autoindent
set mouse=a

" use the system clipboard
set clipboard=unnamedplus

" Set up Solorized 'micha/vim-colors-solarized'
colorscheme solarized
set background=dark

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'morhetz/gruvbox'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'davidhalter/jedi-vim'
Plug 'tell-k/vim-autopep8'
Plug 'itchyny/lightline.vim'
Plug 'vhda/verilog_systemverilog.vim'
call plug#end()

syntax enable
set number
set relativenumber
set cursorline
set history=64
set autoindent
set mouse=a

" 4 space soft tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" use the system clipboard
set clipboard=unnamedplus

"Set up Gruvbox 'morhetz/gruvbox'"
let g:gruvbox_italic=1
colorscheme gruvbox

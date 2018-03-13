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

" 'normal' backspace operation
set backspace=indent,eol,start

" use system keyboard
set clipboard^=unnamedplus

"set ttyfast

syntax enable
set number
set relativenumber
set cursorline
set history=64
set autoindent

" Set up Solorized
colorscheme solarized
set background=dark
"call togglebg#map("<F6>")

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Add nice scrolling when using `j' and `k'
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" mouse scrolling
set mouse=a

" 4 space soft tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Navigating with guides
"	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
"	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
"	map <Space><Tab> <Esc>/<++><Enter>"_c4l
"	inoremap ;gui <++>

" Live preview for LaTeX
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'xelatex'

"""LaTeX (from Luke Smith's VoidRice)
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>

"MARKDOWN (from Luke Smith's VoidRice)
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
	autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
	autocmd Filetype rmd inoremap ;r ```{r,<space>echo=TRUE}<CR>```<CR><CR><esc>2kO


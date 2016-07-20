syntax on
set number
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256

" Pathogen
execute pathogen#infect()
filetype plugin indent on
filetype plugin on

" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" User Alias's
imap jk <Esc>
map <F1> :NERDTreeToggle<CR>
set backspace=indent,eol,start

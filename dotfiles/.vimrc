call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'tomasiser/vim-code-dark'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

set number
set expandtab
set tabstop=2
set shiftwidth=2

" auto format for Rust
let g:rustfmt_autosave = 1

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:ariline#extensions#tabline#formatter = 'unique_tail'
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-o> <Plug>AirlineSelectNextTab
let g:airline_theme = 'codedark'

" fern file exploer
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1
" icon display on
let g:fern#renderer = 'nerdfont'

"Color Scheme
colorscheme codedark

" Syntax
syntax on

" Rust
syntax enable
filetype plugin indent on

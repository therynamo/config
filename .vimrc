set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Syntastic'
Plugin 'othree/yajs.vim'
Plugin 'gavocanov/vim-js-indent'
Plugin 'mxw/vim-jsx'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'

" Key Mappings
:imap jk <Esc>
" JSX Variables
let g:jsx_ext_required = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" AutoFormat Vars
let g:pymode_python = 'python3'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Rust Autoformatting
let g:rustfmt_autosave = 1
" Syntactic Vars
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Nerd Tree Vars
let NERDTreeShowHidden=1

" Syntax
"=========================================
syntax enable
syntax on
autocmd FileType make setlocal noexpandtab
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS " JS Auto-Completion
autocmd BufNewFile,BufRead *.json set ft=javascript " Syntax Highlight JSON
au FileType gitcommit set tw=72
autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
nnoremap <F8> :setl noai nocin nosi inde=
autocmd vimenter * NERDTree
filetype plugin on " Turn on NERDCOMMENTOR

au BufWrite * :Autoformat "Autoformat Files On Save

set tabstop=2       " The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set clipboard=unnamed " Copy paste to clipboard
" ==================================================================
"
" UI
"
set complete+=kspell " autocomplete words with CTRL + N
set incsearch       " search for words incrementally as you type
set number          " line numbers
set showcmd         " show the current command being typed

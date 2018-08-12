set ic
set showmode
set autoindent
set showmatch
set guioptions=mai
set guioptions+=r
set guioptions-=T
syntax on 
set title
set incsearch
set shell=/usr/bin/bash
set showcmd
set hlsearch
set bs=2
set textwidth=75
set formatoptions=roc
set shiftwidth=3
set tabstop=3
set expandtab
set nu
set splitbelow
set splitright
set path=**
filetype plugin on
set pastetoggle=<F3>
set wildmenu
set cursorline

set omnifunc=syntaxcomplete#Complete

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
"Plugin 'majutsushi/tagbar'
call vundle#end()            " required

" #For opening the functions lists in a file
nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F1> :TlistOpen<CR>

" #For Switching between the splits windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
source /home/tjoy/cs_store/cscope.vim
set t_Co=256
colorscheme PaperColor
"set background=dark    " Light theme is used by default

" #CTAGS and vertical splits
" nnoremap <A-]> :only<bar>vsplit<CR>:execute "tag" . expand('<cword>')<CR>
nnoremap <C-\> :execute "vertical ptag " . expand("<cword>")<CR>
set previewheight=100
set term=screen-256color

"for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1

"airline plugin
"1) display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='sol'


"For tagbar I have removed seem taglist is better
"nmap <F4> :TagbarToggle<CR>

"Toggle between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

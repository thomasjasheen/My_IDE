filetype plugin on
syntax on
set ic
set nu
set title
set showcmd
set hlsearch
set showmode
set wildmenu
set showmatch
set incsearch
set expandtab
set autoindent
set splitbelow
set splitright
set cursorline
set number relativenumber
set bs=2
set path=**
set t_Co=256
set tabstop=3
set scrolloff=7                      "Scroll when only 7 below the cursor
set shiftwidth=3
set textwidth=75
set guioptions+=r
set guioptions-=T
set guioptions=mai
set colorcolumn=80                  "Highlight the column 80
set list lcs=tab:\|\                "Display the tabs
set pastetoggle=<F3>
set formatoptions=roc
set previewheight=100
set shell=/usr/bin/bash
set term=screen-256color
set omnifunc=syntaxcomplete#Complete
"set shellcmdflag=-ic                "To make bash ! interactive basic,
                                     "Idea is load aliases
let $BASH_ENV = "~/.bash_aliases"

   "Set the runtime path to include Vundle and initialize
   "======================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   "Let Vundle manage Vundle, required
   "===================================
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'schickele/vim.git'
Plugin 'wimstefan/vim-artesanal'

   "Unused Vundle Plugin
   "=====================
   "Plugin 'vim-scripts/exUtility'
   "Plugin 'majutsushi/tagbar'
   "Plugin 'vim-syntastic/syntastic'
   "Plugin 'Shougo/neocomplete.vim'
   "Plugin 'Valloric/YouCompleteMe'
   "Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()            " required
   "END OF Vundle

   "For opening the Taglists in the current file
   "============================================
nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F1> :TlistOpen<CR>
let Tlist_WinWidth = 70
   "END OF TLIST

   "CTRL-P Defaults
   "==================
let g:ctrlp_by_filename = 1
   "END OF CTRL-P

   "For Switching between the splits windows not working
   "====================================================
   "nnoremap <C-j> <C-W><C-J>
   "nnoremap <C-k> <C-W><C-K>
   "nnoremap <C-l> <C-W><C-L>
   "nnoremap <C-h> <C-W><C-H>
   "END OF SPLIT REMAPS

   "For making Tab as the default tab key
   "=====================================
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>
   "cnoremap <Tab> <C-C><Esc>
   "END OF TAB REMAP


"source /home/tjoy/cs_store/cscope.vim   "should be in plugin folder

   "THEME
   "=====
colorscheme PaperColor
set background=light    " Light theme is used by default
let g:artesanal_italic = 1
   "airline plugin
   "1) display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1
   "let g:airline#extensions#tabline#left_sep = '▶'
   "let g:airline#extensions#tabline#left_alt_sep = '|'
   "let g:airline_theme='solarized light'
   "let g:airline_solarized_bg='light'
   "END OF THEME

   " #CTAGS and vertical splits
nnoremap <C-\> :execute "vertical ptag " . expand("<cword>")<CR>
   " nnoremap <A-]> :only<bar>vsplit<CR>:execute "tag" . expand('<cword>')<CR>
   " END OF CTAGS


   "Syntastic
   "=========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
   "END OF syntastic


   "Toggle between tabs (crossing over with tmux)
   "==============================================
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

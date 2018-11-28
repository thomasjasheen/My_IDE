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
"set makeprg=gcc\ %<                  "To make/compile programs
"                                      cw-qickfixwindow cn,cp errors next,
"                                      previous errors
"set shellcmdflag=-ic                 "To make bash ! interactive basic, 
"                                      Idea is load aliases

let $BASH_ENV = "~/.bash_aliases"


"Set the runtime path to include Vundle and initialize"""""""""""""""""""""""""
"TO INSTALL Vundle execute below statement
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
Plugin 'vim-scripts/PaperColor.vim'
Plugin 'vim-scripts/taglist.vim'

"Unused Vundle Plugin
"=====================
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/exUtility'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'git://git.wincent.com/command-t.git'
call vundle#end()            " required
"END OF Vundle"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For opening the Taglists in the current file""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F1> :TlistOpen<CR>
let Tlist_WinWidth = 70
"END OF TLIST""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For NETWRC""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":vexplore to open file browser
"use v to open in vertical split
"use p to preview
let g:netrw_browse_split      = 4  "browse the split
let g:netrw_banner            = 0  "no banner
let g:netrw_liststyle         = 3  "tree style i to change
let g:netrw_winsize           = 25 "80% for preview
let g:netrw_preview           = 1  "preview vertically
"END OF NETWRC""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"CTRL-P Defaults"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_by_filename = 1
"END OF CTRL-P"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For Switching between the splits windows not working""""""""""""""""""""""""""
"nnoremap <C-j> <C-W><C-J>
"nnoremap <C-k> <C-W><C-K>
"nnoremap <C-l> <C-W><C-L>
"nnoremap <C-h> <C-W><C-H>
"END OF SPLIT REMAPS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   

"For making Tab as the default tab key"""""""""""""""""""""""""""""""""""""""""
"=====================================
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>
"cnoremap <Tab> <C-C><Esc>
"END OF TAB REMAP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   

"THEME"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme PaperColor
set background=light    " Light theme is used by default
let g:artesanal_italic = 1
"airline plugin
"1) display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% |line: %3l |col:%3v'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_detect_iminsert=1
"let g:airline#extensions#tabline#left_sep = '>'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='molokai'
"let g:airline_solarized_bg='dark'
"END OF THEME""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   

"CTAGS and vertical splits"""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-\> :execute "vertical ptag " . expand("<cword>")<CR>
"nnoremap <A-]> :only<bar>vsplit<CR>:execute "tag" . expand('<cword>')<CR>
"END OF CTAGS"""""i""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Syntastic"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"END OF syntastic""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Toggle between tabs (crossing over with tmux)"""""""""""""""""""""""""""""""""
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"cscope.vim""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopetag
set csto=0
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

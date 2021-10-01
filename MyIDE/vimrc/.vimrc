filetype plugin on
syntax enable

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
set tabstop=8
set scrolloff=7                      "Scroll when only 7 below the cursor
set shiftwidth=4
set iskeyword+=-                     "Will add - also as part of single word
set textwidth=75
set guioptions+=r
set guioptions-=T
set guioptions=mai
set colorcolumn=80                  "Highlight the column 80
set list lcs=tab:\|\                 "Display the tabs
set pastetoggle=<F3>
set formatoptions=roc
set previewheight=100
set shell=/bin/bash
set term=screen-256color
set wildmode=longest:full,full
set omnifunc=syntaxcomplete#Complete
"set makeprg=gcc\ %<                  "To make/compile programs
"                                      cw-qickfixwindow cn,cp errors next,
"                                      previous errors
"set shellcmdflag=-ic                 "To make bash ! interactive basic,
"                                      Idea is load aliases

let $BASH_ENV = "~/.bash_aliases"
let mapleader = "\<tab>"
map <F1> :set nonumber<CR>:set norelativenumber<CR>


"Highlight unwanted white space at the end of line  """"""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" END Highlight unwanted white space at the end of line""""""""""""""""""""""""

"Few Emacs shortcuts for insert mode """""""""""""""""""""""""""""""""""""""""
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
" END Few Emacs shortcuts for insert mode """"""""""""""""""""""""""""""""""""


"If fzf commands Eg :File, :BLines.. doesn't work tweak below line based on OS
"Since I use vim-lug now maybe it is not required

"For linux unix
set rtp+=~/.fzf
"
"For MAC OS
"set rtp+=/usr/local/opt/fzf


"Plugin manager
"===================================
"Visit below site for steps to install vim-plug for current platform
"https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'nathanalderson/yang.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/nerdtree'
Plug 'hari-rangarajan/CCTree'
Plug 'triglav/vim-visual-increment'
" increment numbers in visual block like ip-addresses octet

" May be works only for neovim or latest vim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'juneedahamed/vc.vim'  ":VCDiff shows svn diff
Plug 'kshenoy/vim-signature'
" vim-signature for diplaying marks
"Plug 'mhinz/vim-startify'
"Plug 'chrisbra/changesPlugin' ":TCV to display changes from original file
Plug 'jmcantrell/vim-diffchanges' "to display changes

"Install this for neovim along with few others like node.js
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'rhysd/vim-clang-format'

"Unused good Plugin
"=====================
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/exUtility'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'git://git.wincent.com/command-t.git'
""colorscheme not used
"Plugin 'schickele/vim.git'
"Plugin 'wimstefan/vim-artesanal'
"Plugin 'vim-scripts/PaperColor.vim'
"Plugin 'kien/ctrlp.vim'                              "replaced with fzf

call plug#end()

"END OF Plugin"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Linux(text)
    :new
    :resize 20
    :read !a:text
endfunction

command! -nargs=1 Linux :call Linux(<q-args>)

"FZF file tag searching""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_preview_window = ''

" Custom command :PLines for preview and bline
" For :PLines to work you need ripgrep installed in your system
command! -bang -nargs=* PLines
   \ call fzf#vim#grep(
   \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
   \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))




"""TODO: search files info from cscope.files
nnoremap <C-p> :Files<CR>
nnoremap <silent> <leader>/ :PLines<CR>
noremap # *N
"END OF FZF""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"For opening the Taglists in the current file""""""""""""""""""""""""""""""""""
let g:Tlist_GainFocus_On_ToggleOpen = 1 "when toggle move cursor 2 Tlist window
nnoremap <leader>t :NERDTreeClose<CR>:TlistToggle<CR>
let Tlist_WinWidth = 50
"END OF TLIST""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"For NerdTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Close Nerdtree after opening a file
let NERDTreeQuitOnOpen = 1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'

nnoremap <silent> <expr> <leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:TlistClose<CR>\:NERDTreeFind<CR>" : "\:TlistClose<CR>\:NERDTree<CR>"
nnoremap <leader>N :NERDTreeClose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"For NETWRC""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":vexplore to open file browser
"use v to open in vertical split
"use p to preview
let g:netrw_browse_split      = 4  "browse the split
let g:netrw_banner            = 0  "no banner
let g:netrw_liststyle         = 3  "tree style i to change
let g:netrw_winsize           = 70 "80% for preview
let g:netrw_preview           = 1  "preview vertically
let g:netrw_alto              = 0
"END OF NETWRC""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"CTRL-P Defaults"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_by_filename = 1
"let g:ctrlp_extensions = ['tag']
"nnoremap <leader>p :CtrlPTag<CR>
"END OF CTRL-P"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"CCTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CCTreeDisplayMode = 2          "1=ultracompat 2=compact 3=wide not works"
"let CCTreeDbFileMaxSize = 10000000
"let CCTreeSplitProgOption = '-l'
"let CCTreeDbFileSplitLines = 100000
let g:CCTreeKeyTraceForwardTree = '<leader>>'
let g:CCTreeKeyTraceReverseTree = '<leader><'
"let g:CCTreeWindowVertical = 0        "horizontal split"
"let g:CCTreeOrientation = "below"
"END OF CCTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"For Switching between the splits windows""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"END OF SPLIT REMAPS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"For VSPLIT RESIZING FASTER""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-w>> :vertical resize +5<CR>
nnoremap <C-w>< :vertical resize -5<CR>
"END OF VSPLIT RESIZING"""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"For making Tab as the default esc  key"""""""""""""""""""""""""""""""""""""""""
"=====================================
"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <Leader><Tab> <Tab>
"cnoremap <Tab> <C-C><Esc>
"END OF TAB REMAP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"THEME"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme PaperColor
"set background=light    " Light theme is used by default
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
if has("cscope")
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
endif
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

nmap <leader>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


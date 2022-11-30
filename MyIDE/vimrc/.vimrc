
"PREREQUISITES""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Paste below linux commands to shell. remove " at the begning of each line
"Suggestion:Install nvim ripgrep fd & bat (better than vim grep find & cat) in the system
"Install fzf
"git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install
"Install Plug for easy plugin installation
"For nvim
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"For vim
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"Open vim and type :PlugInstall
"END PREREQUISITES"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
"NVIM
"syntax on
"VIM
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
"set mouse=a
set t_Co=256
set tabstop=8
set scrolloff=7                      "Scroll when only 7 below the cursor
set shiftwidth=4
set iskeyword+=-                     "Will add - also as part of single word
set textwidth=75
"set guioptions+=r
"set guioptions=T
"set guioptions=mai
set colorcolumn=80                  "Highlight the column 80
set list lcs=tab:\|\                 "Display the tabs
set pastetoggle=<F3>
set formatoptions=roc
set previewheight=100
set shell=/bin/bash
set term=screen-256color             "may not work for nvim
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
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'hari-rangarajan/CCTree'
Plug 'triglav/vim-visual-increment'
Plug 'terryma/vim-smooth-scroll'
Plug 't9md/vim-quickhl'   " multi-highlight
"Plug 'inkarkat/vim-mark'   " multi-highlight
" increment numbers in visual block like ip-addresses octet

" May be works only for neovim or latest vim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"
Plug 'junegunn/fzf.vim'
Plug 'juneedahamed/vc.vim'  ":VCDiff shows svn diff
" vim-signature for diplaying marks
Plug 'kshenoy/vim-signature'
" vim-signature for diplaying marks
Plug 'mhinz/vim-startify'
":TCV to mark changes, but needs vim8, so commented out
Plug 'chrisbra/changesPlugin' ":TCV to display changes from original file
 "To display changes using :DiffChangesDiffToggle
Plug 'jmcantrell/vim-diffchanges' "to display changes
Plug 'vim-scripts/OmniCppComplete'

Plug 'octol/vim-cpp-enhanced-highlight'

"Install this for neovim along with few others like node.js
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'rhysd/vim-clang-format'
"Plug 'scottdware/vim-slax'
"Plug 'nathanalderson/yang.vim'
""for telescope
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'



"Unused good Plugin
"=====================
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/exUtility'
"Plug 'majutsushi/tagbar'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'git://git.wincent.com/command-t.git'
""colorscheme not used
"Plugin 'schickele/vim.git'
"Plugin 'wimstefan/vim-artesanal'
"Plug 'vim-scripts/PaperColor.vim'
Plug 'morhetz/gruvbox'
"Plugin 'kien/ctrlp.vim'                              "replaced with fzf

call plug#end()

"END OF Plugin"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"MAC (nvim)
"source ~/.coc-vim-setting-tjoy

"Call linux commands in quickfix window """""""""""""""""""""""""""""""""""""""
function! Linux(text)
    :new
    :resize 20
    :read !a:text
endfunction

"command! -nargs=1 Linux :call Linux(<q-args>)
"command -nargs=+ Run :cexpr system('<args>') | copen
"END Call linux commands in quickfix window """""""""""""""""""""""""""""""""""

"Remove all ctrl chars (script cmd o/p file) """"""""""""""""""""""""""""""""""
function! Dos2unix()
    :%s/[[0-9;/]*m//g
    :%s/[[0-9]*C//g
    :%s/[[0-9]*P//g
    :%s/[[0-9]*K//g
    :%s/
//g
    :%s///g
    :%s///g
endfunction
command! -nargs=0 Dos2unix :call Dos2unix()
"END Remove all ctrl chars (script cmd o/p file) """"""""""""""""""""""""""""""

"Dark colourscheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Dark()
    :set background=dark
    :colorscheme gruvbox
    :let g:airline_theme='gruvbox'
    :let g:airline_solarized_bg='dark'
endfunction
command! -nargs=0 Dark :call Dark()
"END Dark colourscheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"Light colourscheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Light()
    :set background=light
    :colorscheme default
    :let g:airline_theme='molokai'
    :let g:airline_solarized_bg='dark'
endfunction
command! -nargs=0 Light :call Light()
"END Light colourscheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"FZF file tag searching""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_preview_window = ''
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Custom command :PLines for preview and bline
" For :PLines to work you need ripgrep installed in your system
command! -bang -nargs=* PLines
   \ call fzf#vim#grep(
   \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
   \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))


function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>]  :Tags<CR>
"""TODO: search files info from cscope.files"""""""""""""""""""""""""""""""""""
nnoremap <C-p> :Files<CR>
nnoremap <silent> <leader>/ :PLines<CR>
noremap # *N
"END OF FZF""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For windows like copy-paste """""""""""""""""""""""""""""""""""""""""""""""""""
"ctrl-c to select and copy to system clipboards 
vmap <C-c> "+y
imap <C-v> <Esc>"+p
"For windows like copy-paste """""""""""""""""""""""""""""""""""""""""""""""""""


"quickhl """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <Leader>M <Plug>(quickhl-manual-reset)
"END of quickhl """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""telescope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
""telescope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"For opening the Taglists in the current file""""""""""""""""""""""""""""""""""
let g:Tlist_GainFocus_On_ToggleOpen = 1 "when toggle move cursor 2 Tlist window
nnoremap <leader>t :NERDTreeClose<CR>:TlistToggle<CR>
let Tlist_WinWidth = 50
"END OF TLIST""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"omnicppcomple""'''''''""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=./tags
map <F2> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"END OF omnicppcomple""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For NerdTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Close Nerdtree after opening a file
let NERDTreeQuitOnOpen = 1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | Startify | execute 'cd '.argv()[0] | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'V'

nnoremap <silent> <expr> <leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:TlistClose<CR>\:NERDTreeFind<CR>" : "\:TlistClose<CR>\:NERDTree<CR>"
nnoremap <leader>N :NERDTreeClose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Smooth scroll""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
"End of Smooth scroll""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"Startify""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = [
 \' ▄▄▄██▀▀▀ ▄▄▄        ██████  ██░ ██ ▓█████ ▓█████  ███▄    █',
 \'   ▒██   ▒████▄    ▒██    ▒ ▓██░ ██▒▓█   ▀ ▓█   ▀  ██ ▀█   █',
 \'   ░██   ▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██░▒███   ▒███   ▓██  ▀█ ██▒',
 \' ██▄██▓  ░██▄▄▄▄██   ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▒▓█  ▄ ▓██▒  ▐▌██▒',
 \' ▓███▒    ▓█   ▓██▒▒██████▒▒░▓█▒░██▓░▒████▒░▒████▒▒██░   ▓██░',
 \' ▒▓▒▒░    ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░░ ▒░ ░░ ▒░   ▒ ▒',
 \' ▒ ░▒░     ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░ ░ ░  ░░ ░░   ░ ▒░',
 \' ░ ░ ░     ░   ▒   ░  ░  ░   ░  ░░ ░   ░      ░      ░   ░ ░',
 \' ░   ░         ░  ░      ░   ░  ░  ░   ░  ░   ░  ░         ░',
 \'']
let g:startify_custom_footer = [
            \'   :CCTreeLoadDB    Load cscope.out for below 2 Function Tree(takes time so make cscope.out as small as possible)',
            \'   <leader> - >     Forward Function Tree                  <leader> - <    Reverse Function Tree',
            \'   <leader> - s     cscope find symbol (split)             <leader> - S    cscope find symbol(same window)',
            \'   <ctrl>   - ]     Go to Definition                       <leader> - ]    Go to defenition (fuzzy search)',
            \'   <leader> - /     Search string in File                  <ctrl>   - p    Find files',
            \'   <leader> - t     Sidebar for Function List              <leader> - n    Directory Tree',
            \'   :VCBlame         svn blame                              :VCDiff         svn diff',
            \'   <leader> - m     Quick multi-highlight                  <leader> - M    Quick multi-highlight reset all',
            \'   <ctrl>   - a     Increment visual select numbers        :Tags           Fuzzy search Tags',
            \'   :dostounix       Remove ctrl chars                      :Rg             Fuzzy search entire Directory',
            \'   <leader> - r     redraw/resize vim screen               <ctrl>   - z    Minimize vim(fg from shell to maximz)',
            \'   :PlugInstall     Install plugins                        :PlugUpgrage    Upgrade intalled plugin'
            \]


"END Startify""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"For Switching between the splits windows not working""""""""""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"END OF SPLIT REMAPS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"For redraw the screen with terminal is messed up""""""""""""""""""""""""""
nmap <leader>r :!resize<CR> <CR>
"END For redraw the screen with terminal is messed up""""""""""""""""""""""""""

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
colorscheme gruvbox
set background=dark
"colorscheme PaperColor
" Light theme is used by default
"set background=dark
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

"let g:airline_theme='molokai'
let g:airline_theme='gruvbox'
let g:airline_solarized_bg='dark'
"END OF THEME""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"CTAGS and vertical splits"""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-\> :execute "vertical ptag " . expand("<cword>")<CR>
"nnoremap <A-]> :only<bar>vsplit<CR>:execute "tag" . expand('<cword>')<CR>
"END OF CTAGS"""""i""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Syntastic"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
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
nmap <leader>S :cs find s <C-R>=expand("<cword>")<CR><CR>
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
nmap <leader>a :vert scs find t <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Highlight unwanted white space at the end of line  """"""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/
" END Highlight unwanted white space at the end of line""""""""""""""""""""""""



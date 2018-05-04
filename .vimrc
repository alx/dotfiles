" Alx .vimrc
" How To Vimrc
" http://dougblack.io/words/a-good-vimrc.html
" Leader Shortcuts {{{
let mapleader = ","     " Leader key
" open ag.vim
nnoremap <leader>a :Ag
" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'vimwiki/vimwiki'
Plug 'wakatime/vim-wakatime'

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
"Plug 'w0rp/ale'

" Balwolf - Steve Losh - dark theme
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'

" ag.vim
Plug 'rking/ag.vim'

" ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'low-ghost/nerdtree-fugitive'

" Fugitive
Plug 'tpope/vim-fugitive'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tabular
Plug 'godlygeek/tabular'

" Syntastic
"Plug 'scrooloose/syntastic'

" Formats
Plug 'sheerun/vim-polyglot'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Indent guide
" <Leader>ig : display guides
Plug 'nathanaelkane/vim-indent-guides'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Easymotion
Plug 'easymotion/vim-easymotion'

" buffer kill
Plug 'qpkorr/vim-bufkill'
" delete a file from the buffer via vim-bufkill with CTRL + c
map <C-c> :BD<cr>

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1

Plug 'tpope/vim-obsession'

" Add plugins to &runtimepath
call plug#end()
" }}}
" Misc {{{
set encoding=utf-8
set ttyfast             " faster redraw
set textwidth=0
set colorcolumn=81

set pastetoggle=<F3>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" makes vim play nicely-ish with fs watchers
" ref: https://github.com/webpack/webpack/issues/781
set backupcopy=yes

" }}}
" Colors {{{

" http://askubuntu.com/questions/67/how-do-i-enable-full-color-support-in-vim
set t_Co=256

syntax enable           " enable syntax processing
set background=dark
colorscheme solarized
" }}}
" Spaces & Tabs {{{
set shiftwidth=2    " Indents width
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set modelines=1
filetype plugin on
set autoindent
" }}}
" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}
" Line Shortcuts {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set backupcopy=yes
" }}}
" Nerdtree {{{

" autostart when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl+n shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" }}}
" Tabular {{{
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" }}}
" Syntasatic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" }}}
" Airline {{{

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" The default setting of 'laststatus' is for the statusline to not appear until
" a split is created. If you want it to appear all the time:
set laststatus=2

" Integrating with powerline fonts
let g:airline_powerline_fonts = 1

" }}}
" Whitespace {{{
autocmd BufWritePre * StripWhitespace
" }}}
" Launch Config {{{
set nocompatible
" }}}
" Window navigation {{{
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0

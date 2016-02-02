" vim
set nocompatible

"-------------------------------------------------------------------------------
" plugin install
"-------------------------------------------------------------------------------
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'thisivan/vim-taglist'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'lambdalisue/vim-unified-diff'

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()

filetype plugin on
filetype indent on
syntax on

NeoBundleCheck

"-------------------------------------------------------------------------------
" plugin configuration
"-------------------------------------------------------------------------------
" itchyny/lightline.vim
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component': {
	\   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
	\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'component_visible_condition': {
	\   'readonly': '(&filetype!="help"&& &readonly)',
	\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	\ },
	\ 'separator': { 'left': '⮀', 'right': '⮂' },
	\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
	\ }

" thisivan/vim-taglist
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Prototype = 1
let Tlist_WinWidth = 45

set diffexpr=unified_diff#diffexpr()

" vim-unified-diff
let unified_diff#executable = 'git'
let unified_diff#arguments = [
	\   'diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0',
	\ ]
let unified_diff#iwhite_arguments = [
	\   '--ignore--all-space',
	\ ]

" previm
let g:previm_open_cmd = 'open -a Safari'

"-------------------------------------------------------------------------------
" options
"-------------------------------------------------------------------------------
" encoding
set encoding=utf8
"set fileencoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,latin1

" window
set background=dark
set notitle
set number
set linespace=1
set helpheight=999
set list
set listchars=tab:>.,trail:␣

" command line
set laststatus=2
set cmdheight=2
set showcmd

" cursor
set nocursorline
set nocursorcolumn
set showmatch
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,],h,l
set scrolloff=4
set sidescrolloff=8
set sidescroll=1

" tab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" indent
set autoindent
set smartindent
set cindent
set cinoptions+=:0

" file
set hidden
set confirm
set autoread
set nobackup
set swapfile
set switchbuf=useopen

" search & substitute & grep
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrapscan
set nogdefault
set grepprg=internal

" OS
set clipboard=unnamed
set mouse=a
set shellslash

" command line
set wildmenu
set wildmode=list:longest,full
set history=10000

" beep
set visualbell t_vb=
set noerrorbells

" timeout
set timeout timeoutlen=1000 ttimeoutlen=100

" spell check
set spell
set spelllang=en

" completion
set complete+=k

" vimdiff
set diffopt=filler,context:10000

"-------------------------------------------------------------------------------
" colorscheme
"-------------------------------------------------------------------------------
colorscheme solarized

"-------------------------------------------------------------------------------
" key map        Normal  Insert  Command Visual
"-------------------------------------------------------------------------------
" map/noremap    @       -       -       @
" nmap/nnoremap  @       -       -       -
" imap/inoremap  -       @       -       -
" cmap/cnoremap  -       -       @       -
" vmap/vnoremap  -       -       -       @
" map!/noremap!  -       @       @       -
"-------------------------------------------------------------------------------
" cursor
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <c-l> g$
noremap <c-h> g^
noremap <c-j> %

" screen
nnoremap s <nop>
nnoremap sj <c-w>j
nnoremap sk <c-w>k
nnoremap sl <c-w>l
nnoremap sh <c-w>h
nnoremap sJ <c-w>J
nnoremap sK <c-w>K
nnoremap sL <c-w>L
nnoremap sH <c-w>H
nnoremap sr <c-w>r
nnoremap s= <c-w>=
nnoremap sw <c-w>w
nnoremap so <c-w>_<c-w>\|
nnoremap ss :<c-u>sp<cr>
nnoremap sv :<c-u>vs<cr>
nnoremap sq :<c-u>q<cr>
nnoremap sQ :<c-u>bd<cr>
nnoremap sev <c-w>v:<c-u>e.<cr>
nnoremap set :<c-u>tabnew.<cr>

" tab
nnoremap s <nop>
nnoremap sn gt
nnoremap sp gT
nnoremap st :<c-u>tabnew<cr>
nnoremap sN :<c-u>bn<cr>
nnoremap sP :<c-u>bp<cr>

" yank
nnoremap <c-y> yaw
vnoremap <c-y> y

" put
nnoremap <c-p> viw"0p

" search
vnoremap * y/\V<c-r>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<cr><cr>gV
nnoremap <silent> <esc><esc> :<c-u>nohlsearch<cr>

" substitute
nnoremap gs :<c-u>%s///g<left><left><left><c-r><c-w><right><right>
vnoremap gs :s///g<left><left><left>

" grep
nnoremap gr :<c-u>gre <c-r><c-w> **/*.

" quickfix
noremap <silent> ql :<c-u>cw<cr>
noremap <silent> qn :<c-u>cn<cr>
noremap <silent> qp :<c-u>cp<cr>

" path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" tag
noremap [tags] <nop>
nmap <space>t [tags]
noremap <silent> [tags]c :<c-u>!ctags -R<cr>
noremap <silent> [tags]a :<c-u>!ctags -aR<cr>
noremap <silent> [tags]l :<c-u>Tlist<cr>

" preview
noremap [preview] <nop>
nmap <space>p [preview]
noremap <silent> [preview]o :<c-u>PrevimOpen<cr>

" align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" auto command
"-------------------------------------------------------------------------------
" binary file
augroup binary
	autocmd!
	autocmd BufReadPre  *.bin let &bin=1
	autocmd BufReadPost * if &bin | %!xxd -g 1
	autocmd BufReadPost * set filetype=xxd | endif
	autocmd BufWritePre * if &bin | %!xxd -r
	autocmd BufWritePre * endif
	autocmd BufWritePost * if &bin | %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

" previm
au BufRead,BufNewFile *.md set filetype=markdown


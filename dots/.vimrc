
" =============================================================================
" GENERAL-SETTINGS:
" =============================================================================

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_ut=''
filetype on
syntax on
syntax enable
filetype plugin indent on
filetype plugin on
" autocmd FileType c,cpp,cs,java,kotlin setlocal commentstring=//%s


" =============================================================================
" PLUGINS:
" =============================================================================

" =============================================================================
" SETTINGS:
" =============================================================================

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set smartindent
set mouse=a
set noswapfile
set scrolloff=5
set noerrorbells
set clipboard=unnamedplus
set modelines=0
set nowrap
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set regexpengine=1      "vim 7.4 introduced weaker regex and setting that option will revert it to the older
set synmaxcol=300               " arbitrary number < 3000 (default value)
set laststatus=2
set showmode
set showcmd
set cursorline
set matchpairs+=<:>
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set number
set shell=bash
set hidden
set cmdheight=1
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set viminfo='100,<9999,s100

" =============================================================================
" COLOR SCHEME:
" =============================================================================
" let g:gruvbox_italic=1
" let g:gruvbox_bold=1

" set background=dark
" colorscheme gruvbox
" color gruvbox
set termguicolors

" =============================================================================
" KEY BINDINGS:
" =============================================================================
" moving between tabs with leader key
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" moving between tabs
map <PageUp> :tabn<CR>
map <PageDown> :tabp<CR>
map <S-PageDown> :tabr<CR>
map <S-PageUp> :tabl<CR>
inoremap <PageUp> <Esc>:tabn<CR>
inoremap <PageDown> <Esc>:tabp<CR>
inoremap <S-PageDown> <Esc>:tabr<CR>
inoremap <S-PageUp> <Esc>:tabl<CR>


" moving to left, right, up & down
map <S-Left> <C-w>h
map <S-Down> <C-w>j
map <S-Up> <C-w>k
map <S-Right> <C-w>l

" rearranging windows to left, right, down and up
map <C-S-Left> <C-w>H
map <C-S-Down> <C-w>J
map <C-S-Up> <C-w>K
map <C-S-Right> <C-w>L

" alternative if ctrl+shift+<arrow_key> does not work in current terminal
" map <leader>q <C-w>H
" map <leader>a <C-w>J
" map <leader>d <C-w>K
" map <leader>e <C-w>L
" deleting with arrows and backspace
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

map <leader>wr :set wrap<CR>
map <leader>nwr :set nowrap<CR>




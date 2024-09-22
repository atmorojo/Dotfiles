" ============================
" Plugins
" ============================
set nocompatible
call plug#begin(expand('~/.vim/bundle/'))
"Tim Pope's
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'              " Git Wrapper
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-git'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

"" General
Plug 'itchyny/lightline.vim'           " Statusline/tabline for Vim
Plug 'junegunn/goyo.vim'               " Distraction free
Plug 'reikim/mdwa.vim'                 " The Most Dangerous Writing App
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'cohama/lexima.vim'
Plug 'freitass/todo.txt-vim'
Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'aklt/plantuml-syntax'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
      \ 'do': 'pnpm install --frozen-lockfile --prod',
      \ 'for': ['javascript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

" Themes
Plug 'dylanaraps/wal' " or other package manager

" General Programming
Plug 'airblade/vim-gitgutter'          " Git Gutter
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                " Fuzzy file finder
Plug 'natebosch/vim-lsc'

call plug#end()

" Basic Settings

set number                      " Display line numbers
set relativenumber
set title                       " show title in console title bar
set wildmode=full               " <Tab> cycles between all matching choices.
set mouse-=a                    " Activate mouse in terminal
set noerrorbells                " Don't bell or blink
au InsertLeave * set nopaste    " Disable paste mode when leaving insert mode

" set termguicolors     " enable true colors support
set background=dark
colorscheme wal

""" Moving Around/Editing {
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set showmatch               " Briefly jump to a parent once it's balanced
set wrap                    " Wrap text
set colorcolumn=81          " highlight column 79 (where words will wrap)
set nofoldenable            " turn off folding
set splitright              " vsplit to right
set splitbelow              " split to below

""" Reading/Writing
set autowriteall            " Don't bother me about changed buffers
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set clipboard=unnamed       " yank and paste in visual mode without *:

""" Messages, Info, Status
set showcmd                 " Show incomplete normal mode commands as I type.
set noshowmode              " Hide the default mode text
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.

""" Swap File
set directory=~/.vim/swap//

""" Undo File
if exists("+undofile")
    set undodir=~/.vim/undo//
    set undofile
endif

""" Edit and reload my vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

""" sudo write this
cmap W! w !sudo tee % >/dev/null<cr>

""" Easy escaping to normal model
inoremap jj <esc>

""" Moving to first or last word in line
nnoremap <S-h> ^
nnoremap <S-l> $

""" Paste from clipboard
inoremap <S-KInsert> <Esc>"+pa
nnoremap <S-KInsert> "+p

""" Changing : into ;
nnoremap ; :

""" Visual shifting
vnoremap < <gv
vnoremap > >gv

""" Goyo Mapping (distraction free) {
nnoremap <F5> :Goyo<cr>
inoremap <F5> <esc>:Goyo<cr>i
""" }

nnoremap <space><space> :nohlsearch<cr>

""" Emmet Setting {
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
""" }

""" FZF Mapping {
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
nnoremap <silent> <leader>g :GFiles --cached --others --exclude-standar<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
""" }

" Lightline setting
let g:lightline = {
            \ 'colorscheme' : 'rosepine',
            \ 'separator' : { 'left': '', 'right': '' },
            \ 'subseparator' : { 'left': '', 'right': '' },
            \ }

" LSC Settings
let g:lsc_server_commands = {
            \ 'php': 'phpactor language-server -vvv',
            \ 'python': 'pylsp',
            \ 'elm': 'elm-language-server',
            \ 'typescript': 'javascript-typescript-stdio',
            \ 'javascript': 'javascript-typescript-stdio'
            \ }
let g:lsc_auto_map = v:true
let g:lsc_enable_autocomplete  = v:true

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader>no :tab drop ./notes.md<CR>
nnoremap <leader>to :tab drop ./todo.txt<CR>

" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = { '*':1 }

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

"" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c"



" ============================
" Plugins
" ============================
set nocompatible
call plug#begin(expand('~/.config/nvim/bundle/'))

" General
Plug 'itchyny/lightline.vim'           " Statusline/tabline for Vim
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'junegunn/goyo.vim'               " Distraction free
Plug 'reikim/mdwa.vim'                  " The Most Dangerous Writing App
Plug 'chrisbra/unicode.vim'             " Easily insert unicode in vim
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'shougo/deoplete.nvim' 
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'lambdalisue/suda.vim'
Plug 'freitass/todo.txt-vim'
Plug 'akretion/vim-odoo-snippets'

" Themes
Plug 'dylanaraps/wal.vim'

" General Programming
Plug 'airblade/vim-gitgutter'          " Git Gutter
Plug 'tpope/vim-fugitive'              " Git Wrapper
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                " Fuzzy file finder
Plug 'SirVer/ultisnips'               " Ultisnip! Snippets!
Plug 'honza/vim-snippets'             " The snippets are here

" HTML
Plug 'rstacruz/sparkup'                " Awesome HAML to HTML by CTRL-E on HTML files

call plug#end()

filetype plugin indent on              " Required!
syntax on                              " syntax highlighing


" Basic Settings
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif

set number                      " Display line numbers
set title                       " show title in console title bar
set wildmenu                    " Menu completion in command mode on <Tab>
set wildmode=full               " <Tab> cycles between all matching choices.
set mouse-=a                    " Activate mouse in terminal
set noerrorbells                " Don't bell or blink
au InsertLeave * set nopaste    " Disable paste mode when leaving insert mode

" GUI Related Settings
if has("gui_running")
    set guifont=Source\ Code\ Pro\ 8
    set guioptions-=m
    set guioptions-=T
endif

"   Appearances
set t_ut=
set t_Co=256

colorscheme wal
set bg=dark
"set cursorline              " have a line indicate the cursor location
"hi clear SignColumn ctermbg=232
"hi Normal ctermbg=233

""" Ignore these files when completing
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png
set wildignore+=*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl
set wildignore+=*.sw?,*.DS_Store?,*.class,eggs/**,*.egg-info/**,*/vendor/**

""" Moving Around/Editing {
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 5 context lines above and below the cursor
set sidescroll=1            " Enable sidescrolling
set sidescrolloff=15
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a parent once it's balanced
set wrap                    " Wrap text
set tabstop=2               " <tab> inserts 'x' spaces
set shiftwidth=2            " And an indent level is 'x' spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes all spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=79            " lines are automatically wrapped after 79 columns
set colorcolumn=79          " highlight column 79 (where words will wrap)
set nofoldenable            " turn off folding
set splitright              " vsplit to right
set splitbelow              " split to below

""" Reading/Writing
set autowriteall            " Don't bother me about changed buffers
set autoread                " Automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set clipboard=unnamed       " yank and paste in visual mode without *:

""" Messages, Info, Status
set showcmd                 " Show incomplete normal mode commands as I type.
set noshowmode              " Hide the default mode text
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

""" Swap File
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif
set directory=~/.vim/swap//

""" Undo File
if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=~/.vim/undo//
    set undofile
endif

" Mapping

""" Set paste mode toggle
set pastetoggle=<F2>

""" Edit and reload my vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

""" Set relative numbering
noremap <leader><leader> :set rnu!<CR>

""" sudo write this
cmap W! w !sudo tee % >/dev/null<cr>

""" Easy escaping to normal model
inoremap jj <esc>

""" Moving to first or last word in line
nnoremap <S-h> ^
nnoremap <S-l> $

""" Clear highlight after searching
nnoremap <silent> <space><space> :silent :nohlsearch<cr>

""" Copy to copy-and-paste clipboard
vnoremap <C-c> "+y

""" Paste from clipboard
inoremap <S-KInsert> <Esc>"+pa
nnoremap <S-KInsert> "+p

""" Changing : into ;
nnoremap ; :

""" Auto change directory to match current file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

""" Visual shifting
vnoremap < <gv
vnoremap > >gv

""" Allow repeat with visual selection
vnoremap . :normal .<CR>

""" Fix ABCD when pressing arrow keys
" the following simply creates an ambiguous mapping so vim fully
" processes the escape sequence for terminal keys, see 'ttimeout' for a
" rough explanation, this just forces it to work
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

""" Plugin Setting & Mapping {

""" Ctags Setting {
if isdirectory($HOME . '/.vim/tags') == 0
    :silent !mkdir -p ~/.vim/tags > /dev/null 2>&1
endif
set tags=./tags;/,~/.vim/tags
""" }

""" Goyo Mapping (distraction free) {
nnoremap <F5> :Goyo<cr>
inoremap <F5> <esc>:Goyo<cr>i
""" }

""" Sparkup Setting {
let g:sparkupExecuteMapping = '<leader>e'
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

""" Vim CSS3 Syntax Setting {
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
""" }

""" Vim Indent Guide {
    let g:indent_guides_start_level = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
""" }

""" Web Setting {
autocmd FileType html,php,css,sass,scss call WebSetting()
function! WebSetting()
    set nowrap
endfunction
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
""" }

au BufNewFile,BufRead *.pro set filetype=make

" UltiSnips Settings
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Lightline setting
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'], 'ale', 'dup', v:true)

"Ale
let g:ale_fixers = {
      \ 'javascript' : ['prettier'],
      \ 'css' : ['prettier'],
      \ 'typescript' : ['prettier'],
      \ 'python' : ['flake8'],
      \}

let g:ale_linters = {
      \ 'javascript' : ['prettier'],
      \ 'css' : ['prettier'],
      \ 'typescript' : ['prettier'],
      \ 'python' : ['flake8'],
      \}

" Suda
let g:suda_smart_edit = 1

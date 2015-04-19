set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

set t_ut=
set t_Co=256
colors Tomorrow-Night-Bright
syn on
set number
set cursorline
highlight LineNr term=bold cterm=NONE ctermfg=237 ctermbg=234 gui=NONE guifg=DarkGrey guibg=#303030
hi Cursorline ctermbg=233
set ignorecase
set smartcase
set hlsearch
set incsearch
set ruler
set wildmenu
set mouse=a
set lazyredraw
set showmatch
set title
map <C-n> :NERDTreeToggle<CR>

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has ("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif


set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

set laststatus=2
nnoremap <silent><F4> :se rnu!<cr>
set pastetoggle=<F2>

nnoremap ; :
let g:airline_powerline_fonts = 1
command W w !sudo tee % > /dev/null

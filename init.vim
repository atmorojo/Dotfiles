call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'preservim/nerdtree'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-vinegar'
call plug#end()

set relativenumber

""" Stolen from Renodesper's vimrc https://github.com/renodesper/dotfiles/blob/master/.vimrc

set nocompatible
call plug#begin(expand('~/.vim/bundle/'))

" General {
    Plug 'itchyny/lightline.vim'           " Statusline/tabline for Vim
    Plug 'junegunn/goyo.vim'               " Distraction free
    Plug 'Lokaltog/vim-easymotion'         " Vim motion on speed (Leader Leader w/f/s)
    Plug 'mhinz/vim-startify'              " Start screen
    Plug 'godlygeek/tabular'               " Text filtering and alignment
" }

" Theme {
    Plug 'chriskempson/vim-tomorrow-theme' " Tomorrow Themes
" }

" General Programming {
    Plug 'majutsushi/tagbar'               " Displays tags in a window, ordered by scope
    Plug 'tpope/vim-fugitive'              " Git integration
    Plug 'lambdalisue/vim-gista'           " Gist
    Plug 'Raimondi/delimitMate'            " Auto close scope (brackets, quotes, etc)
    Plug 'scrooloose/syntastic'            " Awesome syntax checking plugin
    Plug 'tpope/vim-commentary'            " Language-agnostic commenting plugin (gcc gcap gcgc)
    Plug 'airblade/vim-gitgutter'          " Git Gutter
    Plug 'tpope/vim-surround'              " Quoting/parenthesizing made simple (cs'` ds' ysiw] yssb ds{ds))
    Plug 'tpope/vim-repeat'                " Enable repeating supported plugin
    Plug 'nathanaelkane/vim-indent-guides' " Visually displaying indent levels in code
    Plug 'justinmk/vim-syntax-extra'       " A collection of syntax definitions not yet shipped with stock vim
" }

" Snippets & AutoComplete {
    Plug 'honza/vim-snippets'
    Plug 'Shougo/neocomplete.vim'
    Plug 'SirVer/ultisnips'
" }

" HTML {
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'rstacruz/sparkup'  " Awesome HAML to HTML by CTRL-E on HTML files
    Plug 'tpope/vim-haml'  " Vim runtime files for Haml, Sass, and SCSS
" }

" PHP {
    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'beyondwords/vim-twig', {'for': 'php'}
    Plug 'spf13/PIV', {'for': 'php'}
" }

" Python {
    Plug 'jmcomets/vim-pony'  " Django Snippet
    Plug 'klen/python-mode'  " Pick either python-mode or pyflakes & pydoc
    Plug 'python_match.vim'
    Plug 'pythoncomplete'
    Plug 'yssource/python.vim'
" }

" Ruby {
    Plug 'tpope/vim-rails'
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
" }

" Misc {
    Plug 'cespare/vim-toml'
    Plug 'plasticboy/vim-markdown'
    Plug 'shime/livedown'
" }

" Unite, async, and unite tags support {
    " Plug 'Shougo/neomru.vim'
    " Plug 'Shougo/unite.vim'
    " Plug 'Shougo/vimproc.vim', {'do' : 'make -f make_unix.mak' }
    " Plug 'Shougo/vimshell.vim'
    " Plug 'tsukkee/unite-tag'
" }

" Deps {
    if executable('ag')
      Plug 'rking/ag.vim'  " The Silver Searcher
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif
" }

call plug#end()

syntax on                     " syntax highlighing
filetype plugin indent on     " Required!

""" Mapping {
  """ change the leader to be a comma vs slash
  let mapleader=","

  """ Edit my vimrc file
  nnoremap <leader>ev :e $MYVIMRC<cr>

  """ Reload Vimrc
  noremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

  """ Set relative numbering
  noremap <leader><space> :set rnu!<CR>

  """ sudo write this
  cmap W! w !sudo tee % >/dev/null

  """ for when we forget to use sudo to open/edit a file
  cmap w!! w !sudo tee % >/dev/null

  """ and lets make these all work in insert mode too ( <C-O> makes next cmd
  """ happen as if in command mode )
  inoremap <C-W> <C-O><C-W>

  """ Easy escaping to normal model
  inoremap jj <esc>

  """ Fast save
  inoremap <leader>w <esc>:w!<cr>a

  """ Quit window on <leader>q
  inoremap <leader>q <esc>:q<cr>

  """ Easy window resize
  nnoremap <silent> <C-S-h> <C-w><
  nnoremap <silent> <C-S-j> <C-W>-
  nnoremap <silent> <C-S-k> <C-W>+
  nnoremap <silent> <C-S-l> <C-w>>

  """ Moving to first or last word in line
  nnoremap <S-h> ^
  nnoremap <S-l> $

  """ Clear highlight after searching
  nnoremap <silent> <leader>/ :silent :nohlsearch<cr>

  """ New buffer, moving between buffer, close buffer, and list buffer
  nmap <leader>bt :enew<cr>
  nmap <leader>bn :bnext<cr>
  nmap <leader>bp :bprevious<cr>
  nmap <leader>bq :bp <bar> bd #<cr>
  nmap <leader>bl :ls<cr>

  """ Copy to copy-and-paste clipboard
  vnoremap <C-c> "+y

  """ Paste from clipboard
  " inoremap <C-v> <Esc>"+pa
  " nnoremap <C-v> "+p

  """ Changing : into ;
  nnoremap ; :

  """ Very magic for Regex
  " noremap / /\v

  """ Auto change directory to match current file
  nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

  """ Fast saves
  nnoremap <leader>w :w!<cr>

  """ Quit window on <leader>q
  nnoremap <leader>q :q<cr>

  """ Execute itself with python2
  " nnoremap <leader>p :w !python2<cr>

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
""" }

""" Basic Settings {
  if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
  endif

  if has("gui_running")
    set guifont=Source\ Code\ Pro\ 8
    set guioptions-=m
    set guioptions-=T
  endif

  """ Completion (OmniComplete)
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt-=preview

  set number                    " Display line numbers
  set title                     " show title in console title bar
  set wildmenu                  " Menu completion in command mode on <Tab>
  set wildmode=full             " <Tab> cycles between all matching choices.
  set antialias
  set dictionary=/usr/share/dict/usa
  set mouse=a

  """ Color and tmux
  set t_ut=
  set t_Co=256

  colorscheme Tomorrow-Night-Bright
  set background=dark
  hi DiffText gui=underline guibg=red guifg=black
  hi LineNr ctermfg=grey ctermbg=232
  hi clear SignColumn ctermbg=232

  """ Don't bell or blink
  set noerrorbells
  set vb t_vb=

  """ Ignore these files when completing
  set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png
  set wildignore+=*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl
  set wildignore+=*.sw?,*.DS_Store?,*.class,eggs/**,*.egg-info/**,*/vendor/**

  """ Set paste mode toggle
  set pastetoggle=<F2>

  """ Disable paste mode when leaving insert mode
  au InsertLeave * set nopaste
""" }

""" Moving Around/Editing {
  set cursorline              " have a line indicate the cursor location
  set ruler                   " show the cursor position all the time
  set nostartofline           " Avoid moving cursor to BOL when jumping around
  set virtualedit=block       " Let cursor move past the last char in <C-v> mode
  set scrolloff=3             " Keep 5 context lines above and below the cursor
  set sidescroll=1            " Enable sidescrolling
  set sidescrolloff=15
  set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
  set showmatch               " Briefly jump to a parent once it's balanced
  set wrap                    " Wrap text
  " set linebreak               " don't wrap text in the middle of a word
  set autoindent              " always set autoindenting on
  set copyindent              " copy indent from previous line
  set smartindent             " use smart indent if there is no indent file
  set tabstop=4               " <tab> inserts 'x' spaces
  set shiftwidth=4            " And an indent level is 'x' spaces wide.
  set softtabstop=4           " <BS> over an autoindent deletes all spaces.
  set expandtab               " Use spaces, not tabs, for autoindent/tab key.
  set shiftround              " rounds indent to a multiple of shiftwidth
  set formatoptions=tcroql    " Setting text and comment formatting to auto
  set textwidth=79            " lines are automatically wrapped after 79 columns
  set colorcolumn=79          " highlight column 79 (where words will wrap)
  set nofoldenable            " turn off folding
  set splitright              " vsplit to right
  set splitbelow              " split to below

  if &ft == 'css' || &ft == 'sass' || &ft == 'scss'
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
  endif

  if &ft =='md'
      autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  endif

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

  """ Backup File
  if isdirectory('/tmp/vim/backupdir') == 0
    :silent !mkdir -p /tmp/vim/backupdir > /dev/null 2>&1
  endif
  set directory=/tmp/vim/backupdir//

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
""" }

""" Plugin Setting & Mapping {
  """ Ctags Setting {
    if isdirectory($HOME . '/.vim/tags') == 0
      :silent !mkdir -p ~/.vim/tags > /dev/null 2>&1
    endif
    set tags=./tags;/,~/.vim/tags
  """ }

  """ Easymotion Setting & Mapping {
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    nmap f <Plug>(easymotion-s2)
  """ }

  """ Gista Setting {
    let g:gista#github_user = 'atmorojo'
  """ }

  """ Goyo Mapping (distraction free) {
    nnoremap <F5> :Goyo<cr>
    inoremap <F5> <esc>:Goyo<cr>i
  """ }

  """ NeoComplete Setting {
    let g:acp_enableAtStartup = 0                      " Disable AutoComplPop
    let g:neocomplete#enable_at_startup = 1            " Use neocomplete
    let g:neocomplete#enable_smart_case = 1            " Use smartcase
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#max_list = 15
    let g:neocomplete#force_overwrite_completefunc = 1

    " Define dictionary
    let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

    " Define keyword
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Enable omni completion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Enable heavy omni completion
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    """ NeoComplete mapping
    inoremap <expr><C-y> neocomplete#smart_close_popup()
    " <ESC> takes you out of insert mode
    inoremap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
    " <CR>: close popup and save indent
    inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " <TAB>: completion
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
    " <BS>: close popup and delete backword char"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space> and insert <Space>
    inoremap <expr><Space> neocomplete#close_popup() . "\<Space>"
  """ }

  """ PIV Setting {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
  """ }

  """ Pony (Django) Setting {
    let g:pony_prefix = "D"
    let g:pony_display_colors = 1
    let g:pony_manage_filename = "manage.py"
    let g:pony_python_cmd = "python"
  """ }

  """ Python Setting {
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
  """ }

  """ Sparkup Setting {
    let g:sparkupExecuteMapping = '<leader>e'
  """ }

  """ Syntastic Setting {
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['pylint2']
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_quiet_messages = { "type": "style" }
  """ }

  """ Tabular Mapping {
    if exists(":Tabularize")
      nmap <Leader>a& :Tabularize /&<CR>
      vmap <Leader>a& :Tabularize /&<CR>
      nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      nmap <Leader>a=> :Tabularize /=><CR>
      vmap <Leader>a=> :Tabularize /=><CR>
      nmap <Leader>a: :Tabularize /:<CR>
      vmap <Leader>a: :Tabularize /:<CR>
      nmap <Leader>a:: :Tabularize /:\zs<CR>
      vmap <Leader>a:: :Tabularize /:\zs<CR>
      nmap <Leader>a, :Tabularize /,<CR>
      vmap <Leader>a, :Tabularize /,<CR>
      nmap <Leader>a,, :Tabularize /,\zs<CR>
      vmap <Leader>a,, :Tabularize /,\zs<CR>
      nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
  """ }

  """ Tagbar Mapping {
    nnoremap <F3> :TagbarToggle<cr>
    inoremap <F3> <esc>:TagbarToggle<cr>i
  """ }

  """ Unite Setting & Mapping {
    " let g:UltiSnipsExpandTrigger="<leader><Tab>"
    " autocmd FileType unite call s:unite_settings()
    " function! s:unite_settings()
    "   imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
    "   let g:unite_source_history_yank_enable = 1
    " endfunction
    " call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_hidden_files', 'sorter_rank'])

    " nnoremap [unite] <Nop>
    " nmap <space> [unite]
    " nnoremap [unite]f :Unite -start-insert file<cr>
    " nnoremap [unite]a :Unite -start-insert file_rec/async<cr>
    " nnoremap [unite]t :Unite -start-insert tag<cr>
    " nnoremap [unite]g :Unite grep:.<cr>
    " nnoremap [unite]h :Unite -quick-match history/yank<cr>
    " nnoremap [unite]r :Unite -quick-match file_mru<cr>
    " nnoremap [unite]b :Unite -quick-match buffer<cr>

    " imap <silent><buffer><expr> <C-s>     unite#do_action('split')
    " imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
  """ }

  """ Vim CSS3 Syntax Setting {
    augroup VimCSS3Syntax
      autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END
  """ }

  """ Vim Expand Region Setting {
    map + <Plug>(expand_region_expand)
    map _ <Plug>(expand_region_shrink)
  """ }

  """ Vim Indent Guide {
    let g:indent_guides_start_level = 2
    let g:indent_guides_enable_on_vim_startup = 1
  """ }

  """ Vim Multiple Cursor Mapping {
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
  """ }

  """ Web Setting {
    autocmd FileType html,php,css,sass,scss call WebSetting()
    function! WebSetting()
      set nowrap
    endfunction
  """ }
""" }


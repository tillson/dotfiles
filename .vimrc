if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundles')
Plug 'airblade/vim-rooter'
Plug 'chriskempson/tomorrow-theme'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'lepture/vim-jinja'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'thereallogani/vim-hybrid'
Plug 'tpope/vim-sensible'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-syntastic/syntastic'
Plug 'keith/swift.vim'
call plug#end()

au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif

map <C-n> :NERDTreeToggle<CR>
map <C-i> :CtrlPBuffer<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>

set autoindent                  " always set autoindenting on
set background=dark
set backspace=indent,eol,start	" allow backspace over everything in insert
set copyindent                  " copy previous indentation on autoindent
set expandtab
set hidden
set hlsearch                    " highlight search terms
set ignorecase                  " ignore case when searching
set incsearch                   " show search matches as you type
set laststatus=2
set mouse=a
set nobackup
set nocompatible
set nowrap
set number
set scrolloff=5
set shiftround                  " use multiple of shiftwidth when autoindenting w </>
set showmatch                   " set show matching parenthesis
set smartcase                   " ignore case if search pattern is all lowercase
set smarttab                    " insert tabs by shiftwidth
set splitright
set tabstop=4                   " a tab is four spaces
set timeoutlen=1000
set ttimeoutlen=0
set t_Co=256
set cursorline

let g:syntastic_python_checkers = ['flake8']
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

filetype indent on
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType python setlocal shiftwidth=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType cpp setlocal shiftwidth=4
autocmd FileType c setlocal shiftwidth=4
autocmd BufWritePost *.py call Flake8()

" flake8
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1

colorscheme hybrid
hi LineNr ctermfg=grey

autocmd BufWritePre * %s/\s\+$//e
let g:go_version_warning = 0

autocmd vimenter * NERDTree

" Vimrc By Talented Unicorn 
" --------------------------

" Set terminal color to 256 color mode
set t_Co=256

" Set large history size
set history=700

" Edit
set number		" Set line number on
set showmatch		" Highlight matching brace
set visualbell		" Use visual bell (no beeping)
set autoindent		" Auto-indent new lines
set smartindent		" Enable smart-indent
set shiftwidth=4	" Auto indent spaces
set tabstop=4		" Number of spaces per tab
set wrap			" Wrap lines
set smarttab		" Enable smart-tab
set expandtab		" Convert tabs to spaces
set autoread		" Auto read when file is changed from outside
set foldenable		" Enable code folding
set foldmethod=indent	" Fold code by indent
" set relativenumber	" Show relative number

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.vue :call DeleteTrailingWS()

" Key binding
" Show Explore
" map <F3> :NERDTreeToggle<CR>
map <F3> :Explore<CR>
let mapleader = "`"
" Fast saving
nmap <leader>w :w!<cr>	

" Search and replace
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Navigation
" - Buffers
" Previous buffer
nmap <F1> :bprev!<cr>
" Next buffer
nmap <F2> :bnext!<cr>
" Delete buffer - leader+dd
map <silent> <leader>d :bd<cr>
" List buffers
nmap <leader>l :ls<cr>

" Create empty buffer in current window
" map <silent> <leader>n :enew<cr>	
" Press leader and space to remove highlights
map <silent> <leader><space> :noh<cr>	

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Search
set hlsearch		" Highlight search results
set smartcase		" Enable smart-case search
set ignorecase		" Ignore case in search ALWAYS
" Remove search highlights
nmap <silent> <leader>/ :nohlsearch<cr>	

set modifiable		" enable modifiable

" UI
set wildmenu		" Wild menu is on
set showmatch		" Matching brackets yeah?
set showcmd			" Show command on UI

" - Syntax highlighting
syntax enable
try
	colorscheme 16color
catch
  colorscheme elflord
endtry

" set cshtml files to html syntax 
au BufNewFile,BufRead *.cshtml set filetype=html

" set twig syntax highlighting
au BufNewFile,BufRead *.twig set filetype=htmldjango

" - CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

let g:ctrlp_custom_ignore = {
	\'dir':  '\v[\/](\.(git|hg|svn)|\Debug|\Release|node_modules|bower_components|tmp)$',
	\'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|map)$',
\}

 let g:ctrlp_working_path_mode = 'r'

 let g:ctrlp_cmd = 'CtrlP'

" faster search with ag
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore node_modules
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
\ -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug: Plugin manager
call plug#begin()

Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-commentary'
call plug#end()

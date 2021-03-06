let mapleader=" "

set nocompatible                " use vim defaults
filetype off                     " detect type of file
" plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" vim-airline/vim-airline-themes
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:fzf_command_prefix = 'Fzf'

set t_RV=                       " http://bugs.debian.org/608242
" set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129
syntax on                       " turn syntax highlighting on by default
filetype indent on              " load indent file for specific file type

set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set visualbell t_vb=            " turn off error beep/flash

set ruler                       " show the current row and column
set number                      " show line numbers
set showcmd                     " display incomplete commands
set showmode                    " display current modes

set scrolloff=3                 " keep 3 lines when scrolling
set backspace=indent,eol,start  " make that backspace key work the way it should
set showmatch                   " jump to matches when entering parentheses
set matchtime=1                 " tenths of a second to show the matching parenthesis

set hlsearch                    " highlight searches
set incsearch                   " do incremental searching
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" Identify invisible characters and don't show them by default
set list listchars=eol:¬,tab:▸\ ,trail:.,

" Default indenting options
set autoindent smartindent
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

set background=dark

" Make comments and special characters look better
highlight Comment    ctermfg=245 guifg=#8a8a8a
highlight NonText    ctermfg=240 guifg=#585858
highlight SpecialKey ctermfg=240 guifg=#585858

" remap
:map Y y$
map <C-n> :NERDTreeToggle<CR>

noremap j jzz
noremap k kzz
inoremap jj <Esc>
nnoremap <silent> <leader>fo :FzfFiles<CR>
nnoremap <silent> <leader>bl :FzfBLines<CR>
nnoremap <silent> <leader>bo :FzfBuffers<CR>
nnoremap <silent> <leader>do :FzfAg<CR>
nnoremap <silent> <leader>gc :FzfCommits<CR>
nnoremap <silent> <leader>wo :FzfWindows<CR>


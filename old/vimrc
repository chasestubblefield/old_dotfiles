set nocompatible            " don't use vi defaults
set nohidden                " no hidden buffers
set autoread                " reload files when they change on disk
set autowrite               " write files to disk before running commands
set keywordprg=""           " use :help instead of man for K key
set mouse=a                 " use mouse
set nobackup
set nowritebackup
set noswapfile
set laststatus=2            " always show statusline
set showmode                " show mode on bottom line
set showcmd                 " show incomplete commands on bottom line
set ruler                   " show line and col in bottom line
set number                  " show line numbers
set cursorline              " highlight current line
set nowrap                  " no line wrapping
set listchars=tab:▸\ ,eol:¬
set wildmode=list:longest,list:full
set viminfo='0,:0,<0,@0,f0
set autoindent
set smartindent
set smarttab
set expandtab           " use spaces for tab key and indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2
set splitbelow
set splitright

" ========== vundle ==========
filetype off
set rtp +=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-bundler'
Bundle 'jnwhiteh/vim-golang'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-markdown'

filetype plugin indent on

" ========== keys ==========
let mapleader = ","

" edit .vimrc
nnoremap ,v :e $MYVIMRC<CR>

" scroll through buffers
nnoremap ,<Tab> :bnext<CR>
nnoremap ,<S-Tab> :bprevious<CR>

" Show invisibles
nnoremap <Leader>l :set list!<CR>

" Copy file name
nnoremap <Leader>c :let @* = expand("%")<CR>

" Check buffers for changes
nnoremap <Leader>r :checkt<CR>

" Ruby Syntax Check
nnoremap <Leader>e :w !ruby -c<CR>

" git
nnoremap <Leader>d :Git diff<CR>

" rspec
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" No arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

command ClearBuffers bufdo bd

" ========== autocmd ==========
if has("autocmd")
  " source .vimrc on write
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:rspec_command = '!clear && echo rspec {spec} && rspec {spec}'

syntax enable
set background=dark
silent! colorscheme solarized

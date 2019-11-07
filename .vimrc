set nocompatible

filetype on

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle
Plugin 'vim-airline/vim-airline' "Status line for vim
Plugin 'vim-airline/vim-airline-themes' "Status line for vim
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'Valloric/YouCompleteMe' " Code Completion
Plugin 'scrooloose/nerdtree' " File tree
Plugin 'airblade/vim-gitgutter' " Git changes since last revision
Plugin 'ryanoasis/vim-devicons' " Icons for nerdtree
Plugin 'tpope/vim-eunuch' "Unix commands in vim
Plugin 'sheerun/vim-polyglot' " Language packs
Plugin 'junegunn/goyo.vim' " Distraction free writing in vim.
Plugin 'justinmk/vim-syntax-extra' " Extra syntax highlighting for C
Plugin 'junegunn/limelight.vim' "Limelight for Goyo. 
Plugin 'junegunn/fzf'
call vundle#end()
filetype plugin indent on

" colorscheme
colorscheme nord

" vim options
syntax on
set splitbelow
set splitright
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set encoding=utf-8
set cursorline
set wildmenu 
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=3
set foldmethod=indent
set laststatus=2
set noshowmatch
set clipboard=unnamed

" Custom keybindings
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap <space> za
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ycm settings
let g:ycm_server_python_interpreter = '/usr/local/bin/python3.6'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" nerdtree settings
autocmd vimenter * NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Goyo +  limelight configuration
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

function! s:goyo_enter()
	colorscheme pencil
	Limelight
endfunction

function s:goyo_leave()
	colorscheme nord
	Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Airline configuration
let g:airline_powerline_fonts = 1
set t_Co=256


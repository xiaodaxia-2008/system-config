call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"CtrlP is better
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'zchee/deoplete-jedi'
"Plug 'Shougo/deoplete-clangx'
Plug 'ervandew/supertab'
Plug 'pseewald/vim-anyfold'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
"Plug 'dense-analysis/ale'
call plug#end()

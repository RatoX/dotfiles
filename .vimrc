set nocompatible
filetype off

let vimcustom = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
let vimcustombundle = vimcustom . '/bundle/'
let vimcustomvundle = vimcustombundle . '/vundle/'

let &runtimepath.=',' . vimcustom . ',' . vimcustomvundle

set rtp+=&runtimepath

call vundle#begin(vimcustombundle)

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'groenewege/vim-less'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-ruby/vim-ruby'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'digitaltoad/vim-jade'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'moll/vim-node'
Plugin 'chase/vim-ansible-yaml'
Plugin 'roman/golden-ratio'
Plugin 'luochen1990/rainbow'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-pug'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'morhetz/gruvbox'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-syntastic/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'mxw/vim-jsx'
Plugin 'git-time-metric/gtm-vim-plugin'

call vundle#end()
filetype plugin indent on
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
let g:vue_disable_pre_processors=1

runtime! config/*.vim

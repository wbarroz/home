 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'vimoutliner/vimoutliner'
Bundle 'altercation/vim-colors-solarized'
Bundle 'taglist.vim'
Bundle 'dbext.vim'
Bundle 'vcscommand.vim'
" Bundle 'taglist.doc'
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" Bundle 'file:///home/wilson/.vim/taglist_46.zip'
 " ...

 filetype plugin indent on     " required!

syntax on
"colo desert
colo solarized
"set background=light
set background=dark
set smartindent
set autoindent
"4 autocompletion
set wildmode=list:longest
"4 folding
set foldenable
set ignorecase
set smartcase
set infercase
set hls
set is
"set guifont=Envy\ Code\ R\ 14
set guifont=Inconsolata\ 14
"set guifont=Anonymous\ Pro\ 14
set nu
set cursorline
set cursorcolumn
"set timeout timeoutlen=3000 ttimeoutlen=500
set timeout timeoutlen=3000 ttimeoutlen=1000
set ts=4 sts=4 sw=4 noexpandtab
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
let loaded_nerd_tree=1

"Oracle
let g:dbext_default_profile_ORA_URL = 'type=ORA:srvname=//192.168.1.213\:1521/orcl:user=system:passwd=oracle'

 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback
let g:netrw_altv = 1

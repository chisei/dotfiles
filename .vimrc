set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'

" <C-U><C-A>
noremap <C-U><C-A> :Unite buffer file_mru bookmark file<CR>

" default explorer is vimfiler.
let g:vimfiler_as_default_explorer=1

let g:neocomplcache_enable_at_startup = 1

set nobackup
syntax on
set nu
set hlsearch
set backspace=indent,eol,start 
set si
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ignorecase
"モードの表示
set showmode
"ルーラの表示
set ruler

set enc=utf-8
set fenc=utf-8

set iminsert=0
set imsearch=0

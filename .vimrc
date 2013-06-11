set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/syntastic'

" <C-U><C-A>
noremap <C-U><C-A> :Unite buffer file_mru bookmark file<CR>

let g:vimfiler_as_default_explorer=1 " default explorer is vimfiler.

let g:neocomplcache_enable_at_startup=1 " enabled neocomplcache

if has('unix') && executable('/usr/bin/osascript')
    noremap <C-B><C-R> <ESC>:w<CR>:!osascript ~/dotfiles/browser_reload.scpt<CR><CR>
endif

let g:syntastic_auto_jump=1 " エラー箇所に自動でジャンプ

syntax on
set nobackup
set nu
set hlsearch
set backspace=indent,eol,start 
set si
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ignorecase
set showmode "モードの表示
set ruler "ルーラの表示
set enc=utf-8
set fenc=utf-8
set iminsert=0
set imsearch=0

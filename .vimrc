set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/neocomplcache'
NeoBundle 'https://github.com/Shougo/vimfiler'
NeoBundle 'https://github.com/beyondwords/vim-twig'
NeoBundle 'https://github.com/elzr/vim-json'

" <C-U><C-A>
noremap <C-U><C-A> :Unite buffer file_mru bookmark file<CR>

let g:vimfiler_as_default_explorer=1 " default explorer is vimfiler.
let g:vimfiler_safe_mode_by_default=0

let g:neocomplcache_enable_at_startup=1 " enabled neocomplcache

if has('unix') && executable('/usr/bin/osascript')
    noremap <C-B><C-R> <ESC>:w<CR>:!osascript ~/dotfiles/browser_reload.scpt<CR><CR>
endif

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
autocmd BufNewFile,BufRead *.twig set filetype=html.twig

" load local configuration
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

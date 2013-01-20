" mac
if has('unix')
    set guifont=Ricty_Discord:h14
endif

if has('win32')
    set guioptions-=T
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

    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim

    if has('multi_byte_ime')
        highlight Cursor guifg=NONE guibg=Green
        highlight CursorIM guifg=NONE guibg=Purple
    endif

    source $VIMRUNTIME/mswin.vim
endi

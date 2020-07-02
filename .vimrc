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
NeoBundle 'https://github.com/osyo-manga/vim-over'
NeoBundle 'https://github.com/kchmck/vim-coffee-script'
NeoBundle 'https://github.com/briancollins/vim-jst'
NeoBundle 'https://github.com/othree/yajs'

" <C-U><C-A>
noremap <C-U><C-A> :Unite buffer file_mru bookmark file<CR>

let g:vimfiler_as_default_explorer=1 " default explorer is vimfiler.
let g:vimfiler_safe_mode_by_default=0

let g:neocomplcache_enable_at_startup=1 " enabled neocomplcache

if has('unix') && executable('/usr/bin/osascript')
    noremap <C-B><C-R> <ESC>:w<CR>:!osascript ~/dotfiles/browser_reload.scpt<CR><CR>
endif

nnoremap <silent> ,m :OverCommandLine<CR>

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
set noundofile
set autochdir

autocmd BufNewFile,BufRead *.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.es6 set filetype=javascript tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.js setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.md setlocal shiftwidth=2 tabstop=2

" load local configuration
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


filetype plugin indent on

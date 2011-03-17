" --------------------------------------------------------------
" file: 	~/.vimrc
" author: 	Fl4t
" vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:fdm=indent:fdn=1:ft=vim:
" --------------------------------------------------------------

map ; :
syntax on
filetype indent plugin on
colorscheme miromiro

" Surtout rien d'ennuyeux
set noerrorbells        " pas de clignotement quand erreur
set textwidth=0         " pas de limite de largeur du texte
set shortmess=atI       " shorten message prompts a bit
set mousehide           "hide mouse when typing
autocmd winleave * setl nocursorline
autocmd winenter * setl cursorline
set visualbell t_vb=
set guicursor=a:blinkon0

set t_Co=256            " force 256-color mode
set nocompatible        " leave the old ways behind...
set nowrap              " don't wrap lines
set nobackup            " disable backup files (filename~)
set showmode 		" show mode at bottom of screen
set showmatch		" affiche les paires de parenthèses (),{},[]
set splitbelow          " place new files below the current
set clipboard+=unnamed  " yank and copy to X clipboard
set encoding=utf-8      " UTF-8 encoding for all new files
set backspace=2         " full backspacing capabilities (indent,eol,start)
set number              " show line numbers
set ww=b,s,h,l,<,>,[,]  " whichwrap -- left/right keys can traverse up/down
set linebreak           " attempt to wrap lines cleanly
set wildmenu            " enhanced tab-completion shows all matching cmds in a popup menu
set wildmode=list:longest,full
let g:loaded_matchparen=1

" tabs and indenting
set expandtab           " insert spaces instead of tabs
set tabstop=3           " tabs appear as n number of columns
set shiftwidth=3        " n cols for auto-indenting
set autoindent          " auto indents next new line

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " uppercase causes case-sensitive search

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" change la touche par defaut de vim
let mapleader=","

" langage shell par default
set shell=/bin/bash

" Replis & Co.
set foldenable
set foldmethod=marker
set foldminlines=5
set fillchars=fold:·

" affichage rapide
set ttyfast
set ttyscroll=1

" comportement de la selection
set selection=inclusive

" --------------------------------------------------------------
" misc
" --------------------------------------------------------------

" indent-guides plugin
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#202020   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#202020   ctermbg=4

if has("autocmd")
    " always jump to the last cursor position
    autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
    autocmd BufRead *.txt set tw=80 " limit width to n cols for txt files
    autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell   " width, mail syntax hilight, spellcheck
    autocmd FileType tex set tw=80   " wrap at 80 chars for LaTeX files
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
   set mouse=a
endif

" Map keys to toggle functions
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction

command! -nargs=+ MapToggle call MapToggle(<f-args>)
" Keys & functions
MapToggle <F2> paste
MapToggle <F3> spell
MapToggle <F4> number
MapToggle <F7> hlsearch
MapToggle <F8> wrap

" LaTeX settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

" colorise les balises html dans php
let php_sql_query = 1 "Coloration des requetes SQL
let php_htmlInStrings = 1 "Coloration des balises HTML

" Barre de statut & Co.
set laststatus=1 " occasions to show status line, 2=always.
fun! <SID>SetStatusLine() " Set up the status line
   let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
   let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
   let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
   execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
call <SID>SetStatusLine()

" Police
if has('gui_running')
  set guifont=Menlo:h14
endif

" Pour utiliser la synthaxe mysql dans macvim
let g:sql_type_default = 'mysql'

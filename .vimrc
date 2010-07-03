" ----------------------------------------------------------------------------
" file:     ~/.vimrc
" author:   Fl4t
" modified: June 2010
" ----------------------------------------------------------------------------

" Surtout rien d'ennuyeux
autocmd winleave * setl nocursorline
autocmd winenter * setl cursorline
set noerrorbells " pas de clignotement quand erreur
set visualbell t_vb=
set guicursor=a:blinkon0 " pas de clignotement quand erreur
set textwidth=0 " pas de limite de largeur du texte
set shortmess=atI " shorten message prompts a bit
set mousehide "hide mouse when typing

" Indentation & Co.
" set autoindent " auto indents next new line
" set cindent " intelligent indenting
" set cinoptions=g0,:0,l1,(0,t0 "option pour cindent
set expandtab " pour remplacer les espaces par des tabulations
set shiftwidth=4 " nombre de  caractère utilisé pour l'identation
set tabstop=8 " nombre d'éspace par tab
set softtabstop=4
set smarttab
set noet
set wildchar=<tab>
set wildmode=longest:full,full
set backspace=indent,eol,start
filetype on
filetype plugin on
filetype indent on
set copyindent

" Vim defaults
set nocompatible

" Encodage par defaut
set encoding=utf-8

"store .swp files in central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" enable syntax highlighting
syntax on

" langage shell par default
set shell=/bin/bash

" Replis & Co.
set foldenable
set foldmethod=marker
set foldminlines=5
set fillchars=fold:·

" Search & Co.
set hlsearch " highlight all search results
set incsearch " increment search
set ignorecase " case-insensitive search
set smartcase " upper-case sensitive search

" 500 lines of command line history
set history=500

" ruler display in status line
set ruler "voir le curseur all the time
set showmode " show mode at bottom of screen
set number " show line numbers
set nobackup " disable backup files (filename~)

" Superbe menu de complétion \o/
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.cmo,*.cmi,*.a,*.cmx,*.cmxa

" affiche les paires de parenthèses (),{},[]
set showmatch

" affichage rapide
set ttyfast
set ttyscroll=1

" ligne de mode
set modeline

" espacement dans le scrolling haut/bas
set scrolloff=10
set sidescrolloff=10
set sidescroll=1

" Pas de retour à la ligne sur le bord
set nowrap

" comportement de la selection
set selection=inclusive

" sauvegarde auto quand certaine commande
set autowrite

" Ligne de commande
set cmdheight=1 " command line height
set showcmd "voir le mode commande

" Barre de statut & Co.
set laststatus=1 " occasions to show status line, 2=always.
fun! <SID>SetStatusLine() " Set up the status line
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
call <SID>SetStatusLine()

" ----------------------------------------------------------------------------
" Utilities
" ----------------------------------------------------------------------------

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Fonctions pour fichiers CSS
au BufEnter *.php exe Fhtml()

" Fonctions pour fichiers XML
au BufEnter *.xml exe Fxml()

" met en surbrillance les espaces et les tabs en trop
" highlight RedundantSpaces ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:/"
set comments+=n::

" Basic abbreviations
iab DATE <C-R>=strftime("%B %d, %Y (%A, %H:%M)")<CR>

" Fix filetype detection
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.sys set filetype=php
au BufNewFile,BufRead grub.conf set filetype=grub
au BufNewFile,BufRead *.dentry set filetype=dentry
au BufNewFile,BufRead *.blog set filetype=blog

" C file specific options
" au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro

" HTML abbreviations
au FileType html,xhtml,php,eruby imap bbb <br />
au FileType html,xhtml,php,eruby imap aaa <a href=""><left><left>
au FileType html,xhtml,php,eruby imap iii <img src="" /><left><left><left><left>
au FileType html,xhtml,php,eruby imap ddd <div class=""><left><left>

" MS Word document reading
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"

" Reload vimrc when we edit it
au! BufWritePost .vimrc source %

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m

if !has("gui_running")
	" À défaut de pouvoir changer la forme du curseur
	" en fonction du mode de Vim, on peut changer sa couleur
	" en passant par des fonctions de contrôle.
	if &term =~ "rxvt-unicode"
		let &t_SI = "\033]12;red\007"
		let &t_EI = "\033]12;green\007"
		:silent !echo -ne "\033]12;green\007"
		autocmd VimLeave * :silent :!echo -ne "\033]12;green\007"
	endif
	" screen rajoute une couche qu'il faut percer.
	if &term =~ "screen"
		let &t_SI = "\033P\033]12;red\007\033\\"
		let &t_EI = "\033P\033]12;green\007\033\\"
		:silent !echo -ne "\033P\033]12;green\007\033\\"
		autocmd VimLeave * :silent :!echo -ne "\033P\033]12;green\007\033\\"
	endif
endif

" ----------------------------------------------------------------------------
" Raccourci
" ----------------------------------------------------------------------------

" Toggle dark/light default colour theme for shitty terms
map <F2> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

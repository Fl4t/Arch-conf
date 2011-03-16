" ----------------------------------------------------------------------------
" file: ~/.vimrc
" author: Fl4t
" modified: June 2010
" ----------------------------------------------------------------------------

" Surtout rien d'ennuyeux
autocmd winleave * setl nocursorline
autocmd winenter * setl cursorline
set noerrorbells " pas de clignotement quand erreur
set visualbell t_vb=
set guicursor=a:blinkon0 " pas de clignotement
set textwidth=0 " pas de limite de largeur du texte
set shortmess=atI " shorten message prompts a bit
set mousehide "hide mouse when typing

" change la touche par defaut de vim
let mapleader=","

" indentation
set autoindent
set smartindent
set cindent
set expandtab
set shiftwidth=3
set tabstop=3
" indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#202020   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#202020   ctermbg=4


set wildchar=<tab>
set backspace=indent,eol,start
filetype on
filetype plugin on
filetype indent on

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

" colorise les balises html dans php
let php_sql_query = 1 "Coloration des requetes SQL
let php_htmlInStrings = 1 "Coloration des balises HTML

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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" met en surbrillance les espaces et les tabs en trop
"highlight RedundantSpaces ctermbg=blue guibg=blue
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

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
" au FileType html,xhtml,php,eruby imap bbb <br />
" au FileType html,xhtml,php,eruby imap aaa <a href=""><left><left>
" au FileType html,xhtml,php,eruby imap iii <img src="" /><left><left><left><left>
" au FileType html,xhtml,php,eruby imap ddd <div class=""><left><left>

" Reload vimrc when we edit it
au! BufWritePost .vimrc source %

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m

" Pour utiliser la synthaxe mysql dans macvim
let g:sql_type_default = 'mysql'

" Police
if has('gui_running')
  set guifont=Menlo:h14
endif

"Fonction de fermeture de balises
function! InsertCloseTag()
  " inserts the appropriate closing HTML tag
  " may require ignorecase to be set, or to type HTML tags in exactly the same case
  if &filetype == 'html' || &filetype=='php' || &filetype=='xml'

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br br BR DD dd Dd DT dt Dt HR hr Hr Img img IMG input INPUT Input li Li LI link LINK Link meta Meta p P Param param PARAM '

    " remember current position:
    normal mz
    normal mw

    " loop backwards looking for tags:
    let Found = 0
    let NBL = 0
    while Found == 0
        let NBL = NBL+1
        if NBL == 50
            break
        endif

      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

   " if this is a closing tag, skip back to its matching opening tag:
   if @z == '/'
      execute "normal ?\<LT>" . Tag . "\<CR>"

   " if this is a unary tag, then position the cursor for the next
   " iteration:
   elseif match(UnaryTags, ' ' . Tag . ' ') > 0
   normal h

   " otherwise this is the tag that needs closing:
   else
   let Found = 1

   endif
   endwhile " not yet found match

   " create the closing tag and insert it:
   let @z = '</' . Tag . '>'
   normal `z"zp
   normal `w
   execute "normal />\<cr>"
  else " filetype is not HTML
   normal mw
   let @z = '</'
   normal "zp`wll
  endif " check on filetype
endfunction " InsertCloseTag()
imap <lt>/ <Esc>:call InsertCloseTag()<CR>a

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

if has("autocmd")
        " always jump to the last cursor position
        autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
        autocmd BufRead *.txt set tw=80 " limit width to n cols for txt files
        autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell   " width, mail syntax hilight, spellcheck
    autocmd FileType tex set tw=80   " wrap at 80 chars for LaTeX files
endif

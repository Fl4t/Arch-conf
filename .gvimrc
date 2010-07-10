" remove toolbar in gui version
" set giuoption=T

"set shiftwidth=4 " auto-indent amount when using cindent,
                 " >>, << and stuff like that
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5

set autoindent
"set smartindent " replaced by cindent

filetype on
"set tabstop=2
"set expandtab
"retab
set cindent
set noerrorbells
set nohls " don't high light searchs
"set backup " make backup files
"set backupdir=~/.vim/backups " where to put backup files
set guioptions-=T " remove toolbar in gui version
set ruler " status line
set nocompatible " fuck vi and its bugs
set autoread " watch for file changes by other programs
set number " show number lines
set list " we do what to show tabs, to ensure we get them
         " out of my files
set listchars=tab:>-,trail:- " show tabs and trailing 
set showcmd " show the command being typed
set showmatch " show matching brackets


noremap s l
noremap t j
noremap n k


set guifont=Liberation\ Mono\ 8 " My favorite font

" * Spelling
" define `Ispell' language and personal dictionary, used in several places
" below:
let IspellLang = 'british'
let PersonalDict = '~/.ispell_' . IspellLang


"colorscheme desert
"colorscheme wombat
"colorscheme pyte
"colorscheme anotherdark
"colorscheme blackdust
"colorscheme blacklight
"colorscheme clarity
"colorscheme darker-robin
"colorscheme darkspectrum
"colorscheme eclm_wombat
"colorscheme kellys
"colorscheme beyourself
"colorscheme native
colorscheme paintbox
"colorscheme railscasts
"colorscheme summerfruit
"colorscheme two2tango
"colorscheme jellybeans

"
" CloudCity Color Scheme
" ========================
"
" Author:   Micheal John
" Version:  0.1
"
set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "cloudcity"

" Global
hi Normal	term=bold cterm=bold ctermfg=darkgray
hi NonText	term=bold cterm=bold ctermfg=darkgray

" Search
hi Search    guifg=#800000   guibg=#ffae00
hi IncSearch    guifg=#800000   guibg=#ffae00

" Interface Elements
hi StatusLine   guifg=#ffffff   guibg=#43c464   gui=bold
hi StatusLineNC guifg=#9bd4a9   guibg=#51b069
hi VertSplit	guifg=#3687a2   guibg=#3687a2
hi Folded	guifg=#3c78a2   guibg=#c3daea
hi IncSearch	guifg=#708090   guibg=#f0e68c
hi Pmenu	guifg=#ffffff   guibg=#cb2f27
hi SignColumn	guibg=#1b5c8a
hi CursorLine	guibg=#eff2f4
hi LineNr	term=bold cterm=bold ctermfg=darkblue
hi MatchParen	guibg=#cddae5
hi TabLineFill	term=bold ctermfg=white
hi TabLine	term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel	term=bold cterm=bold ctermfg=black ctermbg=red
" Specials
hi Todo		term=bold cterm=bold ctermfg=black ctermbg=red
hi Title	term=bold cterm=bold ctermfg=black
hi Special	term=bold cterm=bold ctermfg=black

" Syntax Elements
hi String	term=bold cterm=bold ctermfg=brown
hi Constant	term=bold cterm=bold ctermfg=darkblue
hi Number	term=bold cterm=bold ctermfg=yellow
hi Statement	term=bold cterm=bold ctermfg=darkred
hi Function	term=bold cterm=bold ctermfg=darkcyan
hi PreProc	term=bold cterm=bold ctermfg=red
hi Comment	term=bold ctermfg=darkmagenta
hi Type		term=bold cterm=bold ctermfg=red
hi Error	term=bold cterm=bold ctermfg=black ctermbg=yellow
hi Identifier	term=bold cterm=bold ctermfg=blue
hi Label	term=bold cterm=bold ctermfg=darkgray
hi Delimiter	term=bold cterm=bold ctermfg=gray
"tab marks
hi SpecialKey  ctermfg=magenta

" HTML Highlighting
hi htmlTag              guifg=#00bdec           gui=bold
hi htmlEndTag           guifg=#00bdec           gui=bold
hi htmlSpecialTagName   guifg=#4aa04a
hi htmlTagName          guifg=#4aa04a
hi htmlTagN             guifg=#4aa04a


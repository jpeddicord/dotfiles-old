"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
" Modifications by Jacob Peddicord <jacob@peddicord.net>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "dante"

" General colors
hi Normal	ctermfg=white
hi Directory	term=bold ctermfg=blue
hi ErrorMsg	term=standout ctermfg=white ctermbg=red
hi NonText	term=bold ctermfg=darkgray
hi SpecialKey	term=bold ctermfg=darkgray
hi LineNr	term=underline ctermfg=darkgray 
hi IncSearch	term=reverse cterm=reverse
hi Search	term=reverse ctermfg=black ctermbg=yellow
hi Visual	term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black
hi VisualNOS	term=bold,underline cterm=bold,underline
hi MoreMsg	term=bold ctermfg=green
hi ModeMsg	term=bold cterm=bold
hi Question	term=standout ctermfg=green
hi WarningMsg	term=standout ctermfg=red
hi WildMenu	term=standout ctermfg=black ctermbg=yellow
hi Folded	term=standout ctermfg=blue ctermbg=237
hi FoldColumn	term=standout ctermfg=blue ctermbg=white
hi DiffAdd	term=bold ctermbg=blue
hi DiffChange	term=bold ctermbg=darkmagenta
hi DiffDelete	term=bold cterm=bold ctermfg=lightblue ctermbg=cyan
hi DiffText	term=reverse cterm=bold ctermbg=red
hi StatusLine	term=reverse cterm=reverse
hi StatusLineNC	term=reverse cterm=reverse
hi VertSplit	term=reverse cterm=reverse
hi Title	term=bold ctermfg=magenta

" syntax hi colors
hi Comment	term=bold ctermfg=darkcyan
hi PreProc	term=underline ctermfg=39
hi Constant	term=underline ctermfg=196
hi Type		term=underline ctermfg=darkgreen
hi Statement	term=bold ctermfg=172
hi Identifier	term=underline ctermfg=darkgreen
hi Ignore	term=bold ctermfg=darkgray
hi Special	term=underline ctermfg=brown
hi Error	term=reverse ctermfg=gray ctermbg=red
hi Todo		term=standout ctermfg=black ctermbg=yellow
hi Underlined	term=underline cterm=underline ctermfg=39
" syntax hi links
hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number
hi link Function	Identifier
hi link Number		Constant
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Operator	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

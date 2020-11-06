" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Steven Vertigan <steven@vertigan.wattle.id.au>
" Last Change:	2006 Sep 23
" Revision #5: Switch main text from yellow to white for easier contrast,
" fixed some problems with terminal backgrounds.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "blue"
hi Normal		guifg=white	guibg=darkBlue	ctermfg=white	ctermbg=darkBlue
hi NonText		guifg=magenta	ctermfg=lightMagenta
hi comment		guifg=gray		ctermfg=gray	ctermbg=darkBlue	gui=bold 
hi constant		guifg=cyan		ctermfg=cyan
hi identifier	guifg=gray		ctermfg=red
hi statement	guifg=yellow		ctermfg=yellow	ctermbg=darkBlue	gui=none
hi preproc		guifg=green		ctermfg=green
hi type			guifg=orange	ctermfg=lightRed	ctermbg=darkBlue
hi special		guifg=magenta	ctermfg=lightMagenta	ctermbg=darkBlue
hi Underlined	guifg=cyan		ctermfg=cyan	gui=underline	cterm=underline
hi label		guifg=white	ctermfg=white
hi operator		guifg=orange	gui=bold	ctermfg=lightRed	ctermbg=darkBlue

hi ErrorMsg		guifg=orange	guibg=darkBlue	ctermfg=lightRed
hi WarningMsg	guifg=cyan		guibg=darkBlue	ctermfg=cyan	gui=bold
hi ModeMsg		guifg=white	gui=NONE	ctermfg=white
hi MoreMsg		guifg=white	gui=NONE	ctermfg=white
hi Error		guifg=red		guibg=darkBlue	gui=underline	ctermfg=red

hi Todo			guifg=black		guibg=orange	ctermfg=black	ctermbg=White
hi Cursor		guifg=black		guibg=yellow		ctermfg=black	ctermbg=yellow
hi Search		guifg=black		guibg=orange	ctermfg=black	ctermbg=White
hi IncSearch	guifg=black		guibg=white	ctermfg=black	ctermbg=White
hi LineNr		guifg=cyan		ctermfg=cyan
hi title		guifg=yellow	gui=bold	cterm=bold

hi StatusLineNC	gui=NONE	guifg=black guibg=darkBlue	ctermfg=black  ctermbg=darkBlue
hi StatusLine	gui=bold	guifg=cyan	guibg=darkBlue	ctermfg=cyan   ctermbg=darkBlue
hi VertSplit	gui=none	guifg=darkBlue	guibg=darkBlue	ctermfg=darkBlue	ctermbg=darkBlue

hi Visual		term=reverse		ctermfg=black	ctermbg=darkCyan	guifg=black		guibg=darkCyan

hi DiffChange	guibg=darkGreen		guifg=black	ctermbg=darkGreen	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		guibg=slateblue		guifg=black		ctermbg=darkBlue		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black	ctermbg=cyan		ctermfg=black

hi Folded		guibg=orange		guifg=black		ctermbg=white		ctermfg=black
hi FoldColumn	guibg=gray30		guifg=black	ctermbg=gray		ctermfg=black
hi cIf0			guifg=gray			ctermfg=gray


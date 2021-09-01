if exists("b:current_syntax")
  finish
endif

syn keyword units reaper marine marauder ghost
syn keyword units hellion hellbat cyclone tank thor mine
syn keyword units medivac liberator viking
syn keyword units BC raven banshee

syn keyword gas gas

syn keyword production barracks factory starport

syn keyword addon techlab reactor

syn keyword supply CC depot orbital

syn keyword upgrade stim cloak combat shield
syn keyword upgrade concussive shells

syn keyword other ebay armory turret bunker sensor tower

syn match exclam "\!"

let b:current_syntax = "bo"

hi exclam ctermfg=1
hi gas ctermfg=2
hi production ctermfg=3
hi addon ctermfg=3
hi supply ctermfg=4
hi upgrade ctermfg=5
hi other ctermfg=5
hi units ctermfg=6


" 0 8  black
" 1 9  red
" 2 10 green
" 3 11 yellow
" 4 12 blue
" 5 13 magenta
" 6 14 cyan
" 7 15 white

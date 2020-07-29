" statusline
highlight clear StatusLine
highlight clear StatusLineNC
highlight StatusLine ctermbg=NONE
highlight StatusLineNC ctermbg=NONE ctermfg=238 guifg=#424450
highlight link User1 DraculaGreen
highlight link User2 DraculaPurple
highlight link User3 DraculaCyan
highlight link User4 DraculaRed
highlight link User5 DraculaOrange
highlight link User6 DraculaPink
highlight link User7 DraculaYellow
highlight link User8 DraculaComment

" background
highlight Normal ctermbg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=#343746

" visual and wildmenu selection
highlight DraculaSelection ctermbg=4 ctermfg=0

" window tab
highlight TabLineFill cterm=NONE gui=NONE
highlight! link TabLineSel DraculaGreen

" comment
highlight Comment ctermfg=61 guifg=#6272a4 cterm=italic gui=italic

" error message
highlight! link ErrorMsg DraculaError
highlight! link CocErrorSign DraculaError
highlight! link CocErrorFloat DraculaError

" warning message
highlight! link WarningMsg DraculaOrange
highlight! link CocInfoSign DraculaOrange
highlight! link CocInfoFloat DraculaOrange

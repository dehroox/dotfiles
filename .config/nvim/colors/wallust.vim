highlight clear

if exists("syntax_on")
syntax reset
endif

if has("terminal")
let g:terminal_ansi_colors = [
\   "#161719", "#FD5FF1", "#87C38A", "#FFD7B1",
\   "#85BEFD", "#B9B6FC", "#85BEFD", "#E0E0E0",
\   "#000000", "#FD5FF1", "#94FA36", "#F5FFA8",
\   "#96CBFE", "#B9B6FC", "#85BEFD", "#E0E0E0"
\ ]
endif

" General UI
hi Normal guifg=#C5C8C6 guibg=#161719 ctermfg=15 ctermbg=235
hi LineNr guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi CursorLineNr guifg=#E0E0E0 guibg=#94FA36 ctermfg=15 ctermbg=10
hi SignColumn guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi NonText guifg=#000000 ctermfg=8
hi SpecialKey guifg=#000000 ctermfg=8
hi Visual guibg=#F5FFA8 ctermbg=11
hi Cursor guifg=#161719 guibg=#C5C8C6 ctermfg=235 ctermbg=1
hi CursorLine guibg=#94FA36 ctermbg=10
hi MatchParen guifg=#E0E0E0 guibg=#96CBFE ctermfg=15 ctermbg=12
hi Pmenu guibg=#94FA36 guifg=#C5C8C6 ctermbg=10 ctermfg=15
hi PmenuSel guibg=#96CBFE guifg=#E0E0E0 ctermbg=12 ctermfg=15
hi FoldColumn guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi Folded guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi Comment guifg=#000000 ctermfg=8
hi StatusLine guifg=#B9B6FC guibg=#94FA36 ctermfg=13 ctermbg=10
hi StatusLineNC guifg=#000000 guibg=#94FA36 ctermfg=8 ctermbg=10
hi VertSplit guifg=#94FA36 guibg=#94FA36 ctermfg=10 ctermbg=10
hi TabLine guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi TabLineSel guifg=#E0E0E0 guibg=#94FA36 ctermfg=15 ctermbg=10
hi TabLineFill guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi ErrorMsg guifg=#FD5FF1 guibg=#161719 ctermfg=9 ctermbg=235
hi WarningMsg guifg=#87C38A guibg=#161719 ctermfg=2 ctermbg=235
hi Underlined guifg=#C5C8C6 ctermfg=15
hi Title guifg=#E0E0E0 ctermfg=15
hi Todo guifg=#87C38A guibg=#161719 ctermfg=2 ctermbg=235

" Syntax highlighting
hi Statement guifg=#FD5FF1 ctermfg=9
hi Identifier guifg=#85BEFD ctermfg=6
hi Function guifg=#B9B6FC ctermfg=5
hi PreProc guifg=#87C38A ctermfg=2
hi Type guifg=#FD5FF1 ctermfg=1
hi StorageClass guifg=#FD5FF1 ctermfg=1
hi Number guifg=#85BEFD ctermfg=4
hi String guifg=#85BEFD ctermfg=14
hi Keyword guifg=#FD5FF1 ctermfg=9
hi Conditional guifg=#FD5FF1 ctermfg=9
hi Repeat guifg=#FD5FF1 ctermfg=9
hi Operator guifg=#C5C8C6 ctermfg=15
hi Label guifg=#85BEFD ctermfg=6
hi Exception guifg=#FD5FF1 ctermfg=1
hi Include guifg=#87C38A ctermfg=2
hi Define guifg=#87C38A ctermfg=2
hi Structure guifg=#FD5FF1 ctermfg=1
hi Typedef guifg=#FD5FF1 ctermfg=1
hi Constant guifg=#85BEFD ctermfg=4
hi Character guifg=#85BEFD ctermfg=4
hi Boolean guifg=#85BEFD ctermfg=4
hi Float guifg=#85BEFD ctermfg=4
hi Ignore guifg=#000000 ctermfg=8

" Specific groups
hi Error guifg=#FD5FF1 guibg=#161719 ctermfg=9 ctermbg=235
hi DiffAdd guifg=#161719 guibg=#85BEFD ctermfg=235 ctermbg=6
hi DiffChange guifg=#161719 guibg=#FD5FF1 ctermfg=235 ctermbg=1
hi DiffDelete guifg=#FD5FF1 guibg=#161719 ctermfg=9 ctermbg=235
hi DiffText guifg=#161719 guibg=#F5FFA8 ctermfg=235 ctermbg=11
hi GitGutterAdd guifg=#85BEFD guibg=#161719 ctermfg=6 ctermbg=235
hi GitGutterChange guifg=#FD5FF1 guibg=#161719 ctermfg=1 ctermbg=235
hi GitGutterDelete guifg=#FD5FF1 guibg=#161719 ctermfg=9 ctermbg=235
hi Folded guifg=#000000 guibg=#000000 ctermfg=8 ctermbg=0
hi IncSearch guifg=#161719 guibg=#E0E0E0 ctermfg=235 ctermbg=15
hi Search guifg=#161719 guibg=#B9B6FC ctermfg=235 ctermbg=13
hi Directory guifg=#B9B6FC ctermfg=5
hi SpellBad guifg=#C5C8C6 ctermfg=15
hi SpellCap guifg=#C5C8C6 ctermfg=15
hi SpellLocal guifg=#C5C8C6 ctermfg=15
hi SpellRare guifg=#C5C8C6 ctermfg=15
hi SpecialComment guifg=#000000 ctermfg=8
hi Delimiter guifg=#C5C8C6 ctermfg=15
hi Number guifg=#85BEFD ctermfg=4
hi Operator guifg=#C5C8C6 ctermfg=15
hi PmenuSbar guifg=#C5C8C6 ctermfg=15
hi PmenuThumb guifg=#C5C8C6 ctermfg=15
hi Tag guifg=#85BEFD ctermfg=6
hi Underlined guifg=#C5C8C6 ctermfg=15
hi WildMenu guifg=#C5C8C6 ctermfg=15

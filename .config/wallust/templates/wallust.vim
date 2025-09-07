highlight clear

if exists("syntax_on")
syntax reset
endif

if has("terminal")
let g:terminal_ansi_colors = [
\   "{{background}}", "{{color1}}", "{{color2}}", "{{color3}}",
\   "{{color4}}", "{{color5}}", "{{color6}}", "{{color7}}",
\   "{{color8}}", "{{color9}}", "{{color10}}", "{{color11}}",
\   "{{color12}}", "{{color13}}", "{{color14}}", "{{color15}}"
\ ]
endif

" General UI
hi Normal guifg={{foreground}} guibg={{background}} ctermfg=15 ctermbg=235
hi LineNr guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi CursorLineNr guifg={{color15}} guibg={{color10}} ctermfg=15 ctermbg=10
hi SignColumn guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi NonText guifg={{color8}} ctermfg=8
hi SpecialKey guifg={{color8}} ctermfg=8
hi Visual guibg={{color11}} ctermbg=11
hi Cursor guifg={{background}} guibg={{cursor}} ctermfg=235 ctermbg=1
hi CursorLine guibg={{color10}} ctermbg=10
hi MatchParen guifg={{color15}} guibg={{color12}} ctermfg=15 ctermbg=12
hi Pmenu guibg={{color10}} guifg={{foreground}} ctermbg=10 ctermfg=15
hi PmenuSel guibg={{color12}} guifg={{color15}} ctermbg=12 ctermfg=15
hi FoldColumn guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi Folded guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi Comment guifg={{color8}} ctermfg=8
hi StatusLine guifg={{color13}} guibg={{color10}} ctermfg=13 ctermbg=10
hi StatusLineNC guifg={{color8}} guibg={{color10}} ctermfg=8 ctermbg=10
hi VertSplit guifg={{color10}} guibg={{color10}} ctermfg=10 ctermbg=10
hi TabLine guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi TabLineSel guifg={{color15}} guibg={{color10}} ctermfg=15 ctermbg=10
hi TabLineFill guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi ErrorMsg guifg={{color9}} guibg={{background}} ctermfg=9 ctermbg=235
hi WarningMsg guifg={{color2}} guibg={{background}} ctermfg=2 ctermbg=235
hi Underlined guifg={{foreground}} ctermfg=15
hi Title guifg={{color15}} ctermfg=15
hi Todo guifg={{color2}} guibg={{background}} ctermfg=2 ctermbg=235

" Syntax highlighting
hi Statement guifg={{color9}} ctermfg=9
hi Identifier guifg={{color6}} ctermfg=6
hi Function guifg={{color5}} ctermfg=5
hi PreProc guifg={{color2}} ctermfg=2
hi Type guifg={{color1}} ctermfg=1
hi StorageClass guifg={{color1}} ctermfg=1
hi Number guifg={{color4}} ctermfg=4
hi String guifg={{color14}} ctermfg=14
hi Keyword guifg={{color9}} ctermfg=9
hi Conditional guifg={{color9}} ctermfg=9
hi Repeat guifg={{color9}} ctermfg=9
hi Operator guifg={{foreground}} ctermfg=15
hi Label guifg={{color6}} ctermfg=6
hi Exception guifg={{color1}} ctermfg=1
hi Include guifg={{color2}} ctermfg=2
hi Define guifg={{color2}} ctermfg=2
hi Structure guifg={{color1}} ctermfg=1
hi Typedef guifg={{color1}} ctermfg=1
hi Constant guifg={{color4}} ctermfg=4
hi Character guifg={{color4}} ctermfg=4
hi Boolean guifg={{color4}} ctermfg=4
hi Float guifg={{color4}} ctermfg=4
hi Ignore guifg={{color8}} ctermfg=8

" Specific groups
hi Error guifg={{color9}} guibg={{background}} ctermfg=9 ctermbg=235
hi DiffAdd guifg={{background}} guibg={{color6}} ctermfg=235 ctermbg=6
hi DiffChange guifg={{background}} guibg={{color1}} ctermfg=235 ctermbg=1
hi DiffDelete guifg={{color9}} guibg={{background}} ctermfg=9 ctermbg=235
hi DiffText guifg={{background}} guibg={{color11}} ctermfg=235 ctermbg=11
hi GitGutterAdd guifg={{color6}} guibg={{background}} ctermfg=6 ctermbg=235
hi GitGutterChange guifg={{color1}} guibg={{background}} ctermfg=1 ctermbg=235
hi GitGutterDelete guifg={{color9}} guibg={{background}} ctermfg=9 ctermbg=235
hi Folded guifg={{color8}} guibg={{color0}} ctermfg=8 ctermbg=0
hi IncSearch guifg={{background}} guibg={{color15}} ctermfg=235 ctermbg=15
hi Search guifg={{background}} guibg={{color13}} ctermfg=235 ctermbg=13
hi Directory guifg={{color5}} ctermfg=5
hi SpellBad guifg={{foreground}} ctermfg=15
hi SpellCap guifg={{foreground}} ctermfg=15
hi SpellLocal guifg={{foreground}} ctermfg=15
hi SpellRare guifg={{foreground}} ctermfg=15
hi SpecialComment guifg={{color8}} ctermfg=8
hi Delimiter guifg={{foreground}} ctermfg=15
hi Number guifg={{color4}} ctermfg=4
hi Operator guifg={{foreground}} ctermfg=15
hi PmenuSbar guifg={{foreground}} ctermfg=15
hi PmenuThumb guifg={{foreground}} ctermfg=15
hi Tag guifg={{color6}} ctermfg=6
hi Underlined guifg={{foreground}} ctermfg=15
hi WildMenu guifg={{foreground}} ctermfg=15

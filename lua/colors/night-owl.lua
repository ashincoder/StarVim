local nightowl = {
  gray1    = '#111111';
  gray2    = '#222222';
  gray3    = '#333333';
  gray4    = '#444444';
  gray7    = '#777777';
  graya    = '#aaaaaa';
  white    = '#d6deeb';
  bright   = '#eeeeee';
  neardark = '#112630';
  purple   = '#c792ea';
  green    = '#c5e478';
  yellow   = '#ffcb8b';
  gray     = '#637777';
  blue     = '#82aaff';
  yellow2  = '#f78c6c';
  yellow3  = '#fbec9f';
  yellow4  = '#f4d554';
  green2   = '#7fdbca';
  red      = '#ff5874';
  blue2    = '#5ca7e4';
  purple2  = '#2d2c5d';
  hoki     = '#5f7e97';
  error_fg = '#EF5350';
  info_fg  = '#64B5F6';
  warn_fg  = '#FFCA28';
  hint_fg  = '#c51cfd';
  none     = 'NONE';
}

function nightowl.terminal_color()
  vim.g.terminal_color_1  = nightowl.red
  vim.g.terminal_color_2  = nightowl.green
  vim.g.terminal_color_3  = nightowl.yellow2
  vim.g.terminal_color_4  = nightowl.blue
  vim.g.terminal_color_5  = nightowl.purple
  vim.g.terminal_color_6  = nightowl.green2
  vim.g.terminal_color_7  = nightowl.graya
  vim.g.terminal_color_8  = nightowl.gray
  vim.g.terminal_color_9  = nightowl.red
  vim.g.terminal_color_10 = nightowl.green
  vim.g.terminal_color_11 = nightowl.yellow2
  vim.g.terminal_color_12 = nightowl.blue
  vim.g.terminal_color_13 = nightowl.purple
  vim.g.terminal_color_14 = nightowl.green2
  vim.g.terminal_color_15 = nightowl.bright
end

function nightowl.highlight(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
  ' ' .. bg..' '..sp)
end

function nightowl.load_syntax()
  local syntax = {
    Normal                               = {fg=nightowl.white,bg=nightowl.bgblue};
    Terminal                             = {fg = nightowl.white,bg=nightowl.darkblue};
    LineNr                               = {fg=nightowl.gray4,   bg=nightowl.bgblue};
    CursorLine                           = {bg=nightowl.neardark};
    CursorLineNr                         = {fg=nightowl.graya,   bg=nightowl.neardark};
    ColorColumn                          = {bg=nightowl.gray2};
    Directory                            = {fg=nightowl.blue};
    DiffAdd                              = {fg=nightowl.bgblue,  bg=nightowl.green};
    DiffChange                           = {fg=nightowl.bgblue,  bg=nightowl.yellow};
    DiffDelete                           = {fg=nightowl.bgblue,  bg=nightowl.red };
    DiffText                             = {fg=nightowl.bgblue,  bg=nightowl.green};
    diffAdded                            = {fg=nightowl.green};
    diffRemoved                          = {fg=nightowl.red};
    VertSplit                            = {fg=nightowl.gray7};
    Folded                               = {fg=nightowl.gray7,   bg=nightowl.bgblue};
    FoldColumn                           = {fg=nightowl.gray3,   bg=nightowl.bgblue};
    SignColumn                           = {fg=nightowl.none,    bg=nightowl.bgblue};
    IncSearch                            = {fg=nightowl.bright,  bg=nightowl.yellow};
    NonText                              = {fg=nightowl.gray4};
    PMenu                                = {bg=nightowl.purple2};
    PMenuSel                             = {bg=nightowl.purple};
    Search                               = {fg=nightowl.bgblue,  bg=nightowl.yellow};
    SpecialKey                           = {fg=nightowl.yellow};
    StatusLine                           = {fg=nightowl.bright,  bg=nightowl.neardark};
    StatusLineNC                         = {fg=nightowl.gray7,   bg=nightowl.neardark};
    Title                                = {fg=nightowl.blue};
    Visual                               = {fg=nightowl.white,   bg=nightowl.purple2};
    EndOfBuffer                          = {fg=nightowl.gray4,   bg=nightowl.bgblue };
    Comment                              = {fg=nightowl.gray,    style='italic'};
    Constant                             = {fg=nightowl.green};
    String                               = {fg=nightowl.yellow};
    Identifier                           = {fg=nightowl.green2};
    Statement                            = {fg=nightowl.blue};
    Operator                             = {fg=nightowl.purple};
    Exception                            = {fg=nightowl.green};
    PreProc                              = {fg=nightowl.purple};
    Type                                 = {fg=nightowl.green};
    StorageClass                         = {fg=nightowl.purple};
    htmlTag                              = {fg=nightowl.gray,    bg=nightowl.none};
    htmlEndTag                           = {fg=nightowl.gray,    bg=nightowl.none};
    Todo                                 = {fg=nightowl.gray7,   bg=nightowl.yellow};
    jsStorageClass                       = {fg=nightowl.blue};
    jsOperator                           = {fg=nightowl.purple};
    jsArrowFunction                      = {fg=nightowl.purple};
    jsString                             = {fg=nightowl.yellow};
    jsComment                            = {fg=nightowl.gray,    style='italic'};
    jsFuncCall                           = {fg=nightowl.blue};
    jsNumber                             = {fg=nightowl.yellow2};
    jsSpecial                            = {fg=nightowl.yellow2};
    jsObjectProp                         = {fg=nightowl.green2};
    jsOperatorKeyword                    = {fg=nightowl.green2};
    jsBooleanFalse                       = {fg=nightowl.red};
    jsBooleanTrue                        = {fg=nightowl.red};
    jsRegexpString                       = {fg=nightowl.blue2};
    jsConditional                        = {fg=nightowl.purple};
    jsFunction                           = {fg=nightowl.blue};
    jsReturn                             = {fg=nightowl.purple};
    jsFuncName                           = {fg=nightowl.blue};
    jsParensError                        = {fg=nightowl.blue};
    jsClassDefinition                    = {fg=nightowl.yellow};
    jsImport                             = {fg=nightowl.purple,  style='italic'};
    jsFrom                               = {fg=nightowl.purple,  style='italic'};
    jsModuleAs                           = {fg=nightowl.purple,  style='italic'};
    jsExport                             = {fg=nightowl.green2};
    jsExportDefault                      = {fg=nightowl.green2};
    jsExtendsKeyword                     = {fg=nightowl.purple,  style='italic'};
    javaScriptReserved                   = {fg=nightowl.blue};
    javaScriptConditional                = {fg=nightowl.purple};
    javaScriptStringS                    = {fg=nightowl.yellow};
    javaScriptBoolean                    = {fg=nightowl.red};
    javaScriptBraces                     = {fg=nightowl.white};
    javaScriptLineComment                = {fg=nightowl.gray,    style='italic'};
    javaScriptSpecial                    = {fg=nightowl.yellow2};
    javaScriptFunction                   = {fg=nightowl.blue};
    javaScriptStatement                  = {fg=nightowl.purple};
    javaScriptException                  = {fg=nightowl.green};
    scssSelectorName                     = {fg=nightowl.green};
    cssTagName                           = {fg=nightowl.red};
    cssClassName                         = {fg=nightowl.green,   style='italic'};
    cssClassNameDot                      = {fg=nightowl.green,   style='italic'};
    cssBraces                            = {fg=nightowl.white};
    cssPositioningProp                   = {fg=nightowl.green2};
    cssBoxProp                           = {fg=nightowl.green2};
    cssDimensionProp                     = {fg=nightowl.green2};
    cssTransitionProp                    = {fg=nightowl.green2};
    cssTextProp                          = {fg=nightowl.green2};
    cssFontProp                          = {fg=nightowl.green2};
    cssBorderProp                        = {fg=nightowl.green2};
    cssBackgroundProp                    = {fg=nightowl.green2};
    cssUIProp                            = {fg=nightowl.green2};
    cssIEUIProp                          = {fg=nightowl.red};
    scssFunctionName                     = {fg=nightowl.green};
    cssPositioningAttr                   = {fg=nightowl.red};
    cssTableAttr                         = {fg=nightowl.red};
    cssCommonAttr                        = {fg=nightowl.red};
    cssColorProp                         = {fg=nightowl.green2};
    cssIncludeKeyword                    = {fg=nightowl.green2};
    cssKeyFrameSelector                  = {fg=nightowl.green};
    cssPseudoClassId                     = {fg=nightowl.green,   style='italic'};
    cssBorderAttr                        = {fg=nightowl.red};
    cssValueLength                       = {fg=nightowl.yellow2};
    cssUnitDecorators                    = {fg=nightowl.yellow3};
    cssIdentifier                        = {fg=nightowl.yellow4, style='italic'};
    markdownHeadingDelimiter             = {fg=nightowl.gray};
    markdownCodeDelimiter                = {fg=nightowl.yellow};
    markdownCode                         = {fg=nightowl.graya};
    mkdCodeStart                         = {fg=nightowl.white};
    mkdCodeEnd                           = {fg=nightowl.white};
    mkdLinkDef                           = {fg=nightowl.green2};
    mkdCodeDelimiter                     = {fg=nightowl.gray,    bg=nightowl.bgblue};
    htmlH1                               = {fg=nightowl.blue,    style='bold'};
    htmlH2                               = {fg=nightowl.blue,    style='bold'};
    htmlH3                               = {fg=nightowl.blue,    style='bold'};
    htmlH4                               = {fg=nightowl.blue};
    htmlH5                               = {fg=nightowl.blue};
    htmlBold                             = {fg=nightowl.purple,  bg=nightowl.bgblue  ,style='bold'};
    shComment                            = {fg=nightowl.gray,    bg=nightowl.bgblue  ,style='italic'};
    NERDTreeDir                          = {fg=nightowl.hoki};
    NERDTreeOpenable                     = {fg=nightowl.red};
    NERDTreeClosable                     = {fg=nightowl.yellow};
    NERDTreeHelp                         = {fg=nightowl.gray4,   style='italic'};
    NERDTreeUp                           = {fg=nightowl.gray};
    NERDTreeDirSlash                     = {fg=nightowl.gray};
    gitcommitSummary                     = {fg=nightowl.white};
    GitGutterAdd                         = {fg=nightowl.green};
    GitGutterChange                      = {fg=nightowl.yellow};
    GitGutterDelete                      = {fg=nightowl.red};
    GitGutterChangeDelete                = {fg=nightowl.yellow};
    LspDiagnosticsSignError              = {fg=nightowl.error_fg};
    LspDiagnosticsSignWarning            = {fg=nightowl.warn_fg};
    LspDiagnosticsSignInformation        = {fg=nightowl.info_fg};
    LspDiagnosticsSignHint               = {fg=nightowl.hint_fg};
    LspDiagnosticsVirtualTextError       = {fg=nightowl.error_fg};
    LspDiagnosticsVirtualTextWarning     = {fg=nightowl.warn_fg};
    LspDiagnosticsVirtualTextInformation = {fg=nightowl.info_fg};
    LspDiagnosticsVirtualTextHint        = {fg=nightowl.hint_fg};
    LspDiagnosticsUnderlineError         = {style="undercurl",sp=nightowl.error_fg};
    LspDiagnosticsUnderlineWarning       = {style="undercurl",sp=nightowl.warn_fg};
    LspDiagnosticsUnderlineInformation   = {style="undercurl",sp=nightowl.info_fg};
    LspDiagnosticsUnderlineHint          = {style="undercurl",sp=nightowl.hint_fg};
  }
  return syntax
end


function nightowl.get_nightowl_color()
  return nightowl
end

function nightowl.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  nightowl.terminal_color()
  local syntax = nightowl.load_syntax()

  for group,colors in pairs(syntax) do
    nightowl.highlight(group,colors)
  end
end

nightowl.colorscheme()

return nightowl

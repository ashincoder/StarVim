local lush = require("lush")
local hsl = lush.hsl

-- TODO

local theme = lush(function()
	local c = {
		bg = hsl(0, 0, 6),
		bg2 = hsl(0, 0, 14),
		bg3 = hsl(0, 0, 21),
		bg4 = hsl(0, 0, 29),

		fg = hsl(187, 9, 83),
		fg2 = hsl(187, 7, 76),
		fg3 = hsl(189, 5, 70),
		fg4 = hsl(180, 3, 63),

		keyword = hsl(12, 45, 61),
		builtin = hsl(44, 32, 49),
		const = hsl(329, 37, 63),
		comment = hsl(15, 2, 55),
		func = hsl(215, 37, 65),
		str = hsl(59, 82, 67),
		type = hsl(240, 35, 67),
		var = hsl(198, 57, 49),
		error = hsl(0, 90, 60),
		warning = hsl(62, 60, 51),
		purple = hsl(329, 37, 63),

		green = hsl(113, 74, 50),
		green_alt = hsl(70, 15, 16),
		orange = hsl(19, 70, 48),
		orange_alt = hsl(14, 51, 16),
		red = hsl(0, 100, 58),
		red_alt = hsl(0, 65, 16),
		yellow = hsl(62, 90, 55),
		yellow_alt = hsl(40, 71, 16),
		aqua = hsl(240, 100, 80),
		aqua_alt = hsl(191, 62, 14),
	}
	return {
		Comment({ bg = "NONE", fg = c.comment, gui = "italic" }),
		Normal({ bg = c.bg, fg = c.fg, gui = "NONE" }),
		CursorLine({ bg = c.bg2.li(8), fg = "NONE", gui = "NONE" }),
		CursorColumn({ CursorLine }),
		ColorColumn({ CursorLine }),
		Conceal({ bg = "NONE", fg = c.aqua, gui = "NONE" }),
		Cursor({ fg = "NONE", bg = "NONE", gui = "reverse" }),
		lCursor({ Cursor }),
		CursorIM({ Cursor }),
		Directory({ bg = "NONE", fg = c.aqua, gui = "NONE" }),
		DiffAdd({ bg = c.aqua_alt, fg = "NONE", gui = "NONE" }),
		DiffChange({ bg = c.aqua_alt, fg = "NONE", gui = "NONE" }),
		DiffDelete({ bg = c.red_alt, fg = "NONE", gui = "NONE" }),
		DiffText({ bg = c.aqua_alt.li(8), fg = "NONE", gui = "NONE" }),
		EndOfBuffer({ bg = "NONE", fg = c.bg2, gui = "NONE" }),
		TermCursor({ Cursor }),
		TermCursorNC({ Cursor }),
		ErrorMsg({ bg = c.red_alt, fg = c.error, gui = "NONE" }),
		VertSplit({ bg = "NONE", fg = c.bg2, gui = "NONE" }),
		Folded({ bg = c.bg2, fg = c.fg3, gui = "NONE" }),
		FoldColumn({ bg = c.bg2, fg = c.fg3, gui = "NONE" }),
		SignColumn({ Normal }),
		Search({ bg = c.purple, fg = c.bg }),
		IncSearch({ Search }),
		Substitute({ Search }),
		LineNr({ bg = "NONE", fg = c.fg2, gui = "NONE" }),
		CursorLineNr({ bg = "NONE", fg = c.fg, gui = "bold" }),
		MatchParen({ CursorLine, fg = "NONE", gui = "underline" }),
		ModeMsg({ Normal }),
		MsgArea({ Normal }),
		MsgSeparator({ Normal }),
		MoreMsg({ bg = "NONE", fg = c.aqua, gui = "NONE" }),
		NonText({ EndOfBuffer }),
		NormalFloat({ bg = c.bg2.da(30), fg = "NONE", gui = "NONE" }),
		FloatBorder({ bg = c.bg2.da(30), fg = c.bg2, gui = "NONE" }),
		NormalNC({ Normal }),
		Pmenu({ bg = c.bg, fg = c.fg4, gui = "NONE" }),
		PmenuSel({ bg = c.bg2, fg = c.fg1, gui = "NONE" }),
		PmenuSbar({ bg = c.bg2.da(50), fg = "NONE", gui = "NONE" }),
		PmenuThumb({ bg = c.bg2.da(30), fg = "NONE", gui = "NONE" }),
		Question({ MoreMsg }),
		QuickFixLine({ CursorLine }),
		SpecialKey({ bg = "NONE", fg = c.aqua, gui = "bold" }),
		SpellBad({ bg = "NONE", fg = c.fg, gui = "underline", sp = c.warning }),
		SpellCap({ bg = "NONE", fg = c.fg, gui = "underline", sp = c.yellow }),
		SpellLocal({ bg = "NONE", fg = c.fg, gui = "underline", sp = c.green }),
		SpellRare({ bg = "NONE", fg = c.fg, gui = "underline", sp = c.aqua }),
		Title({ bg = "NONE", fg = c.aqua, gui = "bold" }),
		Visual({ bg = c.bg2.da(25), fg = "NONE", gui = "NONE" }),
		VisualNOS({ Visual }),
		WarningMsg({ bg = "NONE", fg = c.warning, gui = "NONE" }),
		fgspace({ bg = "NONE", fg = c.aqua.da(35), gui = "NONE" }),
		WildMenu({ PmenuSel }),

		-- Non Defaults

		Constant({ fg = c.const }),
		String({ fg = c.str }),
		Character({ Constant }),
		Number({ fg = c.bg4 }),
		Boolean({ fg = c.orange }),
		Float({ fg = c.orange }),

		Identifier({ fg = c.fg }),
		Function({ fg = c.func }),

		Statement({ fg = c.purple }),
		Conditional({ fg = c.purple }),
		Repeat({ fg = c.purple }),
		Label({ fg = c.purple }),
		Operator({ fg = c.aqua }),
		Keyword({ fg = c.keyword }),
		Exception({ fg = c.purple }),

		PreProc({ fg = c.aqua }),
		Include({ PreProc }),
		Define({ PreProc }),
		Macro({ PreProc }),
		PreCondit({ PreProc }),

		Type({ fg = c.type }),
		StorageClass({ fg = c.orange }),
		Structure({ fg = c.aqua }),
		Typedef({ Type }),

		Special({ fg = c.orange }),
		SpecialChar({ Character }),
		Tag({ fg = c.red }),
		Delimiter({ fg = c.fg.da(25) }),
		SpecialComment({ fg = c.red }),
		Debug({ fg = c.red }),

		Underlined({ fg = "NONE", gui = "underline" }),
		Bold({ fg = "NONE", gui = "bold" }),
		Italic({ fg = "NONE", gui = "italic" }),

		-- ("Ignore", below, may be invisible...)
		Ignore({ fg = c.fg }),
		Error({ bg = c.red_alt, fg = c.error }),
		Todo({ bg = c.aqua, fg = "#11121D", gui = "bold" }),

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.

		LspReferenceText({ Visual, fg = "NONE", gui = "underline" }),
		LspReferenceRead({ Visual, fg = "NONE", gui = "underline" }),
		LspReferenceWrite({ Visual, fg = "NONE", gui = "underline" }),
		LspSignatureActiveParameter({ Visual, fg = c.purple, gui = "underline" }),

		LspDiagnosticsDefaultError({ bg = "NONE", fg = c.error, gui = "underline" }),
		LspDiagnosticsDefaultWarning({ bg = "NONE", fg = c.warning, gui = "underline" }),
		LspDiagnosticsDefaultInformation({ bg = "NONE", fg = c.aqua, gui = "underline" }),
		LspDiagnosticsDefaultHint({ bg = "NONE", fg = c.green, gui = "underline" }),

		LspDiagnosticsVirtualTextError({ LspDiagnosticsDefaultError }),
		LspDiagnosticsVirtualTextWarning({ LspDiagnosticsDefaultWarning }),
		LspDiagnosticsVirtualTextInformation({ LspDiagnosticsDefaultInformation }),
		LspDiagnosticsVirtualTextHint({ LspDiagnosticsDefaultHint }),

		LspDiagnosticsUnderlineError({ fg = "NONE", gui = "underline", sp = c.red }),
		LspDiagnosticsUnderlineWarning({ fg = "NONE", gui = "underline", sp = c.light_yellow }),
		LspDiagnosticsUnderlineInformation({ fg = "NONE", gui = "underline", sp = c.aqua }),
		LspDiagnosticsUnderlineHint({ fg = "NONE", gui = "underline", sp = c.green }),

		LspDiagnosticsFloatingError({ fg = c.error, gui = "NONE" }),
		LspDiagnosticsFloatingWarning({ fg = c.warning, gui = "NONE" }),
		LspDiagnosticsFloatingInformation({ fg = c.aqua, gui = "NONE" }),
		LspDiagnosticsFloatingHint({ fg = c.green, gui = "NONE" }),

		LspDiagnosticsSignError({ fg = c.error, gui = "NONE" }),
		LspDiagnosticsSignWarning({ fg = c.warning, gui = "NONE" }),
		LspDiagnosticsSignInformation({ fg = c.aqua, gui = "NONE" }),
		LspDiagnosticsSignHint({ fg = c.green, gui = "NONE" }),

		-- Tree-Sitter

		TSAnnotation({ bg = "NONE", fg = c.purple }), -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSAttribute({ bg = "NONE", fg = c.aqua }), -- (unstable) TODO: docs
		TSBoolean({ Boolean }), -- booleans.
		TSCharacter({ Character }), -- characters.
		TSComment({ Comment }), -- comment blocks.
		luaTSConstructor({ bg = "NONE", fg = c.fg.da(25) }), -- override Lua curly braces
		TSConstructor({ bg = "NONE", fg = c.orange }), -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
		TSConditional({ Conditional }), -- keywords related to conditionnals.
		TSConstant({ Constant }), -- constants
		TSConstBuiltin({ fg = c.builtin, gui = "bold" }), -- constant that are built in the language: `nil` in Lua.
		TSConstMacro({ Macro }), -- constants that are defined by macros: `NULL` in C.
		TSException({ Exception }), -- exception related keywords.
		TSError({ bg = "NONE", fg = "NONE" }), -- For syntax/parser errors.
		TSField({ bg = "NONE", fg = c.aqua }), -- For fields.
		TSFloat({ Float }), -- floats.
		TSFunction({ Function }), -- function (calls and definitions).
		TSFuncBuiltin({ fg = c.builtin }), -- builtin functions: `table.insert` in Lua.
		TSFuncMacro({ Macro }), -- macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude({ Include }), -- includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword({ Keyword }), -- keywords that don't fall in previous categories.
		TSKeywordFunction({ Keyword }), -- keywords used to define a fuction.
		TSLabel({ Label }), -- labels: `label:` in C and `:label:` in Lua.
		TSMethod({ Function }), -- method calls and definitions.
		TSNamespace({ bg = "NONE", fg = c.aqua }), -- For identifiers referring to modules and namespaces.
		-- TSNone                { },    -- TODO: docs
		TSNumber({ Number }), -- all numbers
		TSOperator({ Operator }), -- any operator: `+`, but also `->` and `*` in C.
		TSParameter({ TSField }), -- parameters of a function.
		TSParameterReference({ TSParameter }), -- references to parameters of a function.
		TSProperty({ TSField }), -- Same as `TSField`.
		TSPunctDelimiter({ Delimiter }), -- delimiters ie: `.`
		TSPunctBracket({ Delimiter }), -- brackets and parens.
		TSPunctSpecial({ Delimiter }), -- special punctutation that does not fall in the catagories before.
		TSRepeat({ Repeat }), -- keywords related to loops.
		TSString({ String }), -- strings.
		TSStringRegex({ TSString }), -- regexes.
		TSStringEscape({ Character }), -- escape characters within a string.
		TSSymbol({ Identifier }), -- identifiers referring to symbols or atoms.
		TSType({ Type }), -- types.
		TSTypeBuiltin({ Type }), -- builtin types.
		TSVariable({ bg = "NONE", fg = c.var }), -- Any variable name that does not have another highlight.
		TSVariableBuiltin({ bg = "NONE", fg = c.builtin }), -- Variable names that are defined by the languages, like `this` or `self`.
		TSWarning({ bg = "NONE", fg = c.warning, gui = "bold" }), -- todo highlight
		TSDanger({ bg = "NONE", fg = c.error, gui = "bold" }), -- todo highlight

		TSTag({ Tag }), -- Tags like html tag names.
		TSTagDelimiter({ Delimiter }), -- Tag delimiter like `<` `>` `/`
		TSText({ fg = c.fg }), -- strings considered text in a markup language.
		TSEmphasis({ gui = "italic" }), -- text to be represented with emphasis.
		TSUnderline({ gui = "underline" }), -- text to be represented with an underline.
		TSStrike({ gui = "strikethrough" }), -- strikethrough text.
		TSTitle({ Title }), -- Text that is part of a title.
		TSLiteral({ String }), -- Literal text.
		TSURI({ fg = "NONE", gui = "underline" }), -- Any URI like a link or email.

		-- gitsigns.nvim
		SignAdd({ fg = c.aqua }), -- Any URI like a link or email.
		SignChange({ fg = c.orange }), -- Any URI like a link or email.
		SignDelete({ fg = c.red }), -- Any URI like a link or email.

		-- telescope.nvim
		TelescopeSelection({ bg = "NONE", fg = c.aqua }),
		TelescopeMatching({ bg = "NONE", fg = c.red, gui = "bold" }),
		TelescopeBorder({ bg = "NONE", fg = c.bg3 }),

		-- nvim-tree.lua
		NvimTreeFolderIcon({ fg = c.aqua }),
		NvimTreeIndentMarker({ fg = c.bg3 }),
		NvimTreeNormal({ fg = c.fg.da(5), bg = c.bg2 }),
		NvimTreeVertSplit({ fg = c.bg, bg = c.bg }),
		NvimTreeFolderName({ fg = c.aqua }),
		NvimTreeOpenedFolderName({ fg = c.aqua.da(10), gui = "italic" }),
		NvimTreeOpenedFile({ NvimTreeOpenedFolderName }),
		NvimTreeRootFolder({ fg = c.aqua.da(20) }),
		NvimTreeExecFile({ fg = c.aqua }),
		NvimTreeImageFile({ fg = c.purple }),
		NvimTreeSpecialFile({ fg = c.aqua }),
		NvimTreeGitStaged({ fg = c.green }),
		NvimTreeGitRenamed({ fg = c.orange }),

		-- some fix for html related stuff
		htmlH1({ Title }),

		-- markdown stuff
		mkdLink({ fg = c.aqua, gui = "underline" }),
		mkdLineBreak({ bg = "NONE", fg = "NONE", gui = "NONE" }),
		mkdHeading({ fg = c.fg }),
		mkdInlineURL({ mkdLink }),
		mkdUnderline({ fg = c.bg3 }),
		markdownUrl({ mkdLink }),
		markdownCode({ fg = c.orange, bg = "NONE" }),
		markdownLinkTextDelimiter({ Delimiter }),
		markdownLinkDelimiter({ Delimiter }),
		markdownIdDelimiter({ Delimiter }),
		markdownLinkText({ fg = c.aqua }),
		markdownItalic({ fg = "NONE", gui = "italic" }),

		-- flutter-tools.nvim
		FlutterWidgetGuides({ fg = c.bg4.li(10) }),

		-- statusline
		StatusLine({ bg = c.bg2, fg = c.fg }),
		StatusLineNC({ bg = c.bg2, fg = c.fg3 }),
		StatusLineMode({ bg = c.bg4, fg = c.bg, gui = "bold" }),
		StatusLineDeco({ bg = c.bg2, fg = c.yellow }),
		StatusLineLCol({ bg = c.bg2, fg = c.fg }),
		StatusLineLColAlt({ bg = c.bg2, fg = c.fg }),
		StatusLineFT({ bg = c.bg2, fg = c.fg }),
		StatusLineFTAlt({ bg = c.bg2, fg = c.fg }),
		StatusLineGit({ bg = c.bg4, fg = c.bg }),
		StatusLineGitAlt({ bg = c.bg4, fg = c.bg }),
		StatusLineLSP({ bg = c.bg2, fg = c.fg3 }),
		StatusLineFileName({ bg = c.bg2, fg = c.fg, gui = "bold" }),

		-- lsp-trouble.nvim
		LspTroubleIndent({ fg = c.bg4.li(10) }),

		-- tabline stuff
		TabLine({ bg = c.bg2, fg = c.fg, gui = "NONE" }),
		TabLineFill({ bg = c.bg2, fg = c.fg, gui = "NONE" }),
		TabLineSel({ bg = c.aqua, fg = c.bg2, gui = "NONE" }),

		-- tabline diagnostic
		TabLineError({ LspDiagnosticsSignError }),
		TabLineWarning({ LspDiagnosticsSignWarning }),
		TabLineHint({ LspDiagnosticsSignHint }),
		TabLineInformation({ LspDiagnosticsSignInformation }),

		-- which-key.nvim
		WhichKeyFloat({ bg = c.bg2 }),

		-- nvim-compe
		CompeDocumentation({ Pmenu, fg = "NONE" }),

		-- diffview
		DiffviewNormal({ NvimTreeNormal }),
		DiffviewVertSplit({ fg = c.bg, bg = c.bg }),
		DiffviewStatusAdded({ SignAdd }),
		DiffviewStatusModified({ SignChange }),
		DiffviewStatusRenamed({ SignChange }),
		DiffviewStatusDeleted({ SignDelete }),
		DiffviewFilePanelInsertion({ SignAdd }),
		DiffviewFilePanelDeletion({ SignDelete }),
	}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap

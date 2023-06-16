local present, blankline = pcall(require, "indent_blankline")

if not present then
	return
end

vim.opt.list = true

local options = {
	--show_current_context = true,
	space_char_blankline = " ",
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"nvchad_cheatsheet",
		"lsp-installer",
		"NvimTree",
		"",
	},
	buftype_exclude = { "terminal" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
}

blankline.setup(options)

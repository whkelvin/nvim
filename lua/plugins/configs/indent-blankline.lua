local present, blankline = pcall(require, "ibl")

if not present then
	return
end

vim.opt.list = false

local options = {
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"packer",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"nvchad_cheatsheet",
			"lsp-installer",
			"NvimTree",
			"startup",
			"",
		},
	},
}

blankline.setup(options)

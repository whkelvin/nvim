require("winbar").setup({
	enabled = true,
	show_file_path = true,
	show_symbols = false,
	show_file_icon = false,
	colors = {
		path = "#8fbcbb", -- TODO: ref color here
		file_name = "#8fbcbb",
		symbols = "#8fbcbb",
	},
	icons = {
		file_icon_default = "",
		seperator = "/",
		editor_state = "●",
		lock_icon = "",
	},
	exclude_filetype = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"qf",
		"startup",
	},
})

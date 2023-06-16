local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local middle = screen_h / 2

require("startup").setup({
	section_1 = {
		-- "text" -> text that will be displayed
		-- "mapping" -> create mappings for commands that can be used
		-- use mappings.execute_command on the commands to execute
		-- "oldfiles" -> display oldfiles (can be opened with mappings.open_file/open_file_split)
		type = "text", -- can be mappings or oldfiles
		oldfiles_directory = false, -- if the oldfiles of the current directory should be displayed
		align = "center", -- "center", "left" or "right"
		fold_section = false, -- whether to fold or not
		title = "title", -- title for the folded section
		-- if < 0 fraction of screen width
		-- if > 0 numbers of column
		margin = 5, -- the margin for left or right alignment
		-- type of content depends on `type`
		-- "text" -> a table with string or a function that requires a function that returns a table of strings
		-- "mapping" -> a table with tables in the format:
		-- {
		--   {<displayed_command_name>, <command>, <mapping>}
		--   {<displayed_command_name>, <command>, <mapping>}
		-- }
		-- e.g. {" Find File", "Telescope find_files", "<leader>ff" }
		-- "oldfiles" -> ""
		content = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		},
		highlight = "Statement", -- highlight group in which the section text should be highlighted
		default_color = "", -- a hex color that gets used if you don't specify `highlight`
		oldfiles_amount = 0, -- the amount of oldfiles to be displayed
	}, -- for the structure of a section see below
	options = {
		mapping_keys = false, -- display mapping (e.g. <leader>ff)
		-- if < 0 fraction of screen width
		-- if > 0 numbers of column
		cursor_column = 0.5,
		after = function() -- function that gets executed at the end
		end,
		empty_lines_between_mappings = true, -- add an empty line between mapping/commands
		disable_statuslines = true, -- disable status-, buffer- and tablines
		paddings = { middle - 3 }, -- amount of empty lines before each section (must be equal to amount of sections)
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2", -- the color of folded sections
		-- this can also be changed with the `StartupFoldedSection` highlight group
	},
	parts = { "section_1" }, -- all sections in order
})

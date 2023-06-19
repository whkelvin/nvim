local wk = require("which-key")
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- navigation between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

wk.register({
	["<leader>"] = {
		f = { "<cmd> :Telescope find_files <CR>", "Find Files" },
	},
})

wk.register({
	["<leader>"] = {
		n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
	},
})

wk.register({
	["<leader>f"] = {
		name = "+FileManagement",
		a = {
			"<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>",
			"Find All Files (inc Hidden)",
		},
	},
})

wk.register({
	["<leader>"] = {
		b = { "<cmd> :Telescope buffers<CR>", "List Buffers" },
	},
})
wk.register({
	["<leader>b"] = {
		name = "+BufferManagement",
		x = { "<cmd> :bd <CR>", "Close Current Buffer" },
		X = { "<cmd> :bd! <CR>", "Force Close Current Buffer" },
	},
})

wk.register({
	["<TAB>"] = { "<cmd> :bnext <CR>", "Next Buffer" },
})

wk.register({
	["<S-TAB>"] = { "<cmd> :bprevious <CR>", "Prev Buffer" },
})

-- search
wk.register({
	["<leader>"] = {
		s = { "<cmd> :Telescope live_grep <CR>", "Search" },
	},
})

--lsp
wk.register({
	["<leader>l"] = {
		name = "Lsp Actions",
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go To References" },
		a = { "<cmd> lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		p = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
	},
})

wk.register({
	["<leader>e"] = {
		name = "Diagnostics",
		l = { "<cmd> :Telescope diagnostics bufnr=0 <CR>", "Show Diagnostics In Current Buffer" },
		g = { "<cmd> :Telescope diagnostics <CR>", "Show Diagnostics" },
		h = { "<cmd> lua vim.diagnostic.open_float()<CR>", "Error Hover" },
		n = { "<cmd> lua vim.diagnostic.goto_next()<CR>", "Error Next" },
		p = { "<cmd> lua vim.diagnostic.goto_prev()<CR>", "Error Prev" },
	},
})

-- Hop
map(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
map(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)
map(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
)
map(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
)

map("n", "<leader>/", "<cmd> :HopPattern <cr>")
map("o", "<leader>/", "<cmd> :HopPattern <cr>")
map("v", "<leader>/", "<cmd> :HopPattern <cr>")

map("n", "<ESC>", "<cmd> :noh <CR>")

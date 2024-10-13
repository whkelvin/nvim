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

vim.api.nvim_set_keymap("c", "<DOWN>", "<TAB>", {})
vim.api.nvim_set_keymap("c", "<UP>", "<S-TAB>", {})


wk.add({
	{ "<leader>n", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
})

wk.add({
	{ "<leader>o", ":Oil --float <CR>", desc = "Toggle Oil" },
})

wk.add({
	{ "<leader>f", "<cmd> :Telescope find_files <CR>", desc = "List Files" },
})

wk.add({
	{ "<leader>f", group = "FileManagement" },
	{
		"<leader>fa",
		"<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>",
		desc = "Find All Files (inc Hidden)",
	},
})

wk.add({
	{ "<leader>b", "<cmd> :Telescope buffers<CR>", desc = "List Buffers" },
})

wk.add({
	{ "<leader>b", group = "BufferManagement" },
	{ "<leader>bX", "<cmd> :bd! <CR>", desc = "Force Close Current Buffer" },
	{ "<leader>bx", "<cmd> :bd <CR>", desc = "Close Current Buffer" },
})

wk.add({
	{ "<TAB>", "<cmd> :bnext <CR>", desc = "Next Buffer" },
})

wk.add({
	{ "<S-TAB>", "<cmd> :bprevious <CR>", desc = "Prev Buffer" },
})

-- search
wk.add({
	{ "<leader>s", "<cmd> :Telescope live_grep <CR>", desc = "Search" },
})

--nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
--nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
--nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
--nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
--nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
--nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
--lsp
wk.add({
	{
		{ "<leader>l", group = "Lsp Actions" },
		{ "<leader>la", "<cmd> lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
		{ "<leader>lg", "<cmd> lua vim.lsp.buf.definition()<CR>", desc = "Go To Definition" },
		{ "<leader>ld", "<cmd> lua require('goto-preview').goto_preview_definition()<CR>", desc = "Go To Definition In Preview" },
		{ "<leader>lq", "<cmd> lua require('goto-preview').close_all_win()<CR>", desc = "Close Preview" },
		{ "<leader>lh", "<cmd> lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
		{
			"<leader>li",
			"<cmd>lua vim.lsp.buf.implementation()<CR>",
			desc = "Go To Implementation",
		},
		{ "<leader>lp", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go To References" },
		{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
	},
})

wk.add({
	{ "<leader>e", group = "Diagnostics" },
	{ "<leader>eg", "<cmd> Telescope diagnostics <CR>", desc = "Show Diagnostics" },
	{ "<leader>eh", "<cmd> lua vim.diagnostic.open_float()<CR>", desc = "Error Hover" },
	{ "<leader>el", "<cmd> Telescope diagnostics bufnr=0 <CR>", desc = "Show Diagnostics In Current Buffer" },
	{ "<leader>en", "<cmd> lua vim.diagnostic.goto_next()<CR>", desc = "Error Next" },
	{ "<leader>ep", "<cmd> lua vim.diagnostic.goto_prev()<CR>", desc = "Error Prev" },
})

wk.add({
  {"<leader>x", group = "Execute"},
  {"<leader>xr", "<cmd> Rest run <CR>", desc = "Execute current http file"}
})

wk.add(
{
  {"<leader>g", group = "Spelling"},
  {"<leader>gs", "<cmd> lua vim.opt.spell = not(vim.opt.spell:get())<cr>", desc="Toggle Spell Check"},
}
)

wk.add({
  {"<leader>v", group = "Emoji"},
  {"<leader>ve", "<cmd>IconPickerInsert emoji<cr>", desc="Emoji"},
  {"<leader>vn", "<cmd>IconPickerInsert nerd_font<cr>", desc="Nerd Font"},
  {"<leader>vg", "<cmd>IconPickerInsert symbols<cr>", desc="glyphs"},
  {"<leader>vs", "<cmd>IconPickerInsert alt_cont<cr>", desc="Symbol"},
})

map("n", "<leader>gn", "]s")
map("n", "<leader>gp", "[s")
map("n", "<leader>gg", "zg")

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

map("n", "<leader>/", "<cmd> HopPattern <cr>")
map("o", "<leader>/", "<cmd> HopPattern <cr>")
map("v", "<leader>/", "<cmd> HopPattern <cr>")

map("n", "<ESC>", "<cmd> :noh <CR>")

map("x", "p", "P")

map("n", "<leader>h", "<cmd> lua require('harpoon.ui').toggle_quick_menu() <cr>")
map("n", "<leader>j", "<cmd> lua require('harpoon.ui').nav_next() <cr>")
map("n", "<leader>k", "<cmd> lua require('harpoon.ui').nav_prev() <cr>")
map("n", "<leader>m", "<cmd> lua require('harpoon.mark').add_file() <cr>")
map("n", "<leader>1", "<cmd> lua require('harpoon.ui').nav_file(1) <cr>")
map("n", "<leader>2", "<cmd> lua require('harpoon.ui').nav_file(2) <cr>")
map("n", "<leader>3", "<cmd> lua require('harpoon.ui').nav_file(3) <cr>")
map("n", "<leader>4", "<cmd> lua require('harpoon.ui').nav_file(4) <cr>")



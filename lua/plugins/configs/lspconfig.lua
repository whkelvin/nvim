-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.rls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    rust = {
      unstable_features = false,
      build_on_save = false,
      all_features = true,
    }
  }
}

-- local root_is_introhive = vim.fn.getcwd() == '/Users/whkelvin/Projects/introhive'

require 'lspconfig'.angularls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require 'lspconfig'.tsserver.setup {}

require 'lspconfig'.solargraph.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/whkelvin/.omnisharp/OmniSharp"

require 'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)};
}

require'lspconfig'.vuels.setup{}

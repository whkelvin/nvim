-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            lsp_formatting(bufnr)
        end,
    })
  end
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local null_ls_status_ok, null_ls = pcall(require, 'null-ls')

if not null_ls_status_ok then
  print('null ls not working');
  return
end

null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
      filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "svelte"}
    }),
    null_ls.builtins.diagnostics.eslint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
  end,
})

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

--require 'lspconfig'.angularls.setup {
--  capabilities = capabilities,
--  on_attach = on_attach
--}

require 'lspconfig'.tsserver.setup {
  filetypes = {'typescript', 'javascript'},
  capabilities = capabilities,
  on_attach = function (client)
    -- null-ls will do the formatting
    client.server_capabilities.document_formatting = false
  end
}

require 'lspconfig'.svelte.setup {
  capabilities = capabilities,
  on_attach = function (client)
    client.server_capabilities.document_formatting = false
  end
}

--
--require'lspconfig'.volar.setup{
--  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
--  on_attach = function (client)
--    client.server_capabilities.document_formatting = false
--  end
--}

require'lspconfig'.tailwindcss.setup{
  on_attach = on_attach
}

require 'lspconfig'.solargraph.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/whkelvin/.omnisharp/OmniSharp"

require 'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
}

--require'lspconfig'.vuels.setup {
--  on_attach = on_attach,
--}

require'lspconfig'.sumneko_lua.setup {
  on_attach = function (client)
    -- null-ls will do the formatting
    client.server_capabilities.document_formatting = false
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

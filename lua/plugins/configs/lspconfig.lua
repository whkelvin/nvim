local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

local lsp_server = require("lspconfig")
lsp_server.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
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
})

lsp_server.ts_ls.setup({
  filetypes = { "typescript", "javascript" },
})

lsp_server.svelte.setup({})

lsp_server.gopls.setup({})

lsp_server.tailwindcss.setup({})
lsp_server.html.setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "Handlebars",
        "svelte",
      },
    }),
    null_ls.builtins.formatting.fnlfmt.with({
      filetypes = {
        "fennel",
        "fnl",
        "yuck",
      },
    }),
    null_ls.builtins.formatting.csharpier,
  },
  on_attach = on_attach,
})

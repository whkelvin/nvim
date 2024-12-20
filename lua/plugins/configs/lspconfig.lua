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

local cap = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)


local lsp_server = require("lspconfig")

lsp_server.ts_ls.setup({
  filetypes = { "typescript", "javascript", "typescriptreact" },
  capabilities = cap,
  single_file_support = false,
  root_dir = lsp_server.util.root_pattern("package.json"),
  on_attach = function(client, buf)
    on_attach(client, buf)
    client.handlers["textDocument/publishDiagnostics"] = function() end
  end,
})

lsp_server.svelte.setup({
  capabilities = cap,
  on_attach = on_attach,
})

lsp_server.gopls.setup({
  capabilities = cap,
  on_attach = on_attach,
})

lsp_server.tailwindcss.setup({
  capabilities = cap,
  on_attach = on_attach,
})

--local html_capabilities = vim.lsp.protocol.make_client_capabilities()
--html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_server.html.setup({
  capabilities = cap,
  on_attach = on_attach,
})
--lsp_server.phpactor.setup({})
lsp_server.intelephense.setup {
  capabilities = cap,
  on_attach = on_attach,
}
lsp_server.kulala_ls.setup {
  capabilities = cap,
  on_attach = on_attach,
}
lsp_server.lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
  capabilities = cap,
  on_attach = on_attach,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint.with({
      condition = function(utils)
        return not utils.root_has_file({ "deno.json" })
      end,
    }),
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
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
    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.deno_fmt,
  },
  on_attach = on_attach,
})

lsp_server.denols.setup({
  single_file_support = false,
  root_dir = lsp_server.util.root_pattern("deno.json"),
  on_attach = on_attach,
})

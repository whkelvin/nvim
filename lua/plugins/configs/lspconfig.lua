local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format(
          {
            async = false,
            filter = function(lspClient)
              return lspClient.name ~= 'ts_ls'
            end
          })
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

vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  cmd = { "./node_modules/.bin/typescript-language-server", "--stdio" },
})
vim.lsp.enable('html')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('svelte')
--vim.lsp.config('svelte', {
--  cmd = { "./node_modules/.bin/svelteserver", "--stdio" },
--})
--vim.lsp.config('ts_ls',{
--  filetypes = { "typescript", "javascript", "typescriptreact" },
--  capabilities = cap,
--  single_file_support = false,
--  root_dir = function(bufnr, on_dir)
--    if vim.fs.root(bufnr, 'package.json') then on_dir(vim.fn.getcwd()) end
--  end,
--  on_attach = on_attach,
--})
--
--vim.lsp.config('svelte',{
--  capabilities = cap,
--  on_attach = on_attach,
--})
--
--vim.lsp.config('gopls',{
--  capabilities = cap,
--  on_attach = on_attach,
--})
--
--vim.lsp.config('tailwindcss',{
--  capabilities = cap,
--  on_attach = on_attach,
--})
--
----local html_capabilities = vim.lsp.protocol.make_client_capabilities()
----html_capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--vim.lsp.config('html',{
--  capabilities = cap,
--  on_attach = on_attach,
--})
--
--vim.lsp.config('kulala_ls', {
--  capabilities = cap,
--  on_attach = on_attach,
--})
--
--vim.lsp.config('lua_ls', {
--  on_init = function(client)
--    if client.workspace_folders then
--      local path = client.workspace_folders[1].name
--      if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
--        return
--      end
--    end
--
--    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
--      runtime = {
--        version = "LuaJIT",
--      },
--      workspace = {
--        checkThirdParty = false,
--        library = {
--          vim.env.VIMRUNTIME,
--          -- Depending on the usage, you might want to add additional paths here.
--          -- "${3rd}/luv/library"
--          -- "${3rd}/busted/library",
--        },
--      },
--    })
--  end,
--  settings = {
--    Lua = {
--      diagnostics = {
--        globals = { 'vim' },
--      }
--    },
--  },
--  capabilities = cap,
--  on_attach = on_attach,
--})


local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    require("none-ls.diagnostics.eslint"),
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
        "typescript",
      },
      --extra_args = {
      --  "--config",
      --  ".prettierrc.json"
      --}
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
    --null_ls.builtins.formatting.deno_fmt,
  },
  on_attach = on_attach,
})

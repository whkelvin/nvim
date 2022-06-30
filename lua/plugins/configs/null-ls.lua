local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.prettier.with(
    {
      prefer_local = "node_modules/.bin",
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
  end,
})

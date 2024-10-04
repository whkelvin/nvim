local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  print("treesitter not present")
  return
end

local options = {
  ensure_installed = {
    "c",
    "c_sharp",
    "css",
    "dart",
    "dockerfile",
    "fish",
    "go",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "prisma",
    "python",
    "regex",
    "rust",
    "scss",
    "sql",
    "svelte",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  matchup = {
    enable = true,
  },
}

treesitter.setup(options)

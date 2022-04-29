local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  print('treesitter not present')
  return
end

local options = {
   ensure_installed = "all",
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}

treesitter.setup(options)

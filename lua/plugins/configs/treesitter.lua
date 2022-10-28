local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  print('treesitter not present')
  return
end

local options = {
   ensure_installed = "all",
   ignore_install = {"phpdoc"},
   highlight = {
      enable = true,
   },
}

treesitter.setup(options)

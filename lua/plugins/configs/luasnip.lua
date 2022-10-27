local present, luasnip = pcall(require, "luasnip")

luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").load()

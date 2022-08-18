local present, luasnip = pcall(require, "luasnip")

luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

luasnip.filetype_extend("dart", {"flutter"})

require("luasnip.loaders.from_vscode").lazy_load()


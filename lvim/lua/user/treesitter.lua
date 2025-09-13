require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
-- require('nvim-ts-autotag').setup()
-- lvim.builtin.treesitter.ensure_installed = {
--   "python",
--   "json"
-- }


lvim.builtin.gitsigns.opts.signs = {
  add          = { text = '+' },
  change       = { text = '|' },
  delete       = { text = '_' },
  topdelete    = { text = '‾' },
  changedelete = { text = '~' },
  untracked    = { text = '┆' },
}



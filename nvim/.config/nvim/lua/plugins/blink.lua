return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        sql = { "dadbod" },
      },
      providers = {
        dadbod = {
          name = "dadbod",
          module = "vim_dadbod_completion.blink",
        },
      },
    },
  },
}

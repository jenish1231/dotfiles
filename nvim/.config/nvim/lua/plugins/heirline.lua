return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    table.insert(opts.statusline, 5, {
      init = function(self)
        self.path = vim.fn.expand "%:~:."
        if self.path == "" then
          self.path = "[No Name]"
          self.icon = ""
        else
          local filename = vim.fn.expand "%:t"
          local devicons = require "nvim-web-devicons"
          self.icon = ""
        end
      end,

      provider = function(self)
        -- icon (yellow) + path (blue)
        return string.format("%%#HeirlineIcon#%s%%#HeirlinePath# %s ", self.icon, self.path)
      end,
    })

    return opts
  end,
}

return {

  { "psliwka/vim-smoothie" },

  { "RyanMillerC/better-vim-tmux-resizer" },
  { "nvim-pack/nvim-spectre" },
  "andweeb/presence.nvim",
  { "0x00-ketsu/maximizer.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "tpope/vim-surround",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
      explorer = {
        enabled = false,
      },
    },
    keys = {
      {
        "<C-p>",
        function() require("snacks").picker.files() end,
      },
    },
  },

  { "sindrets/diffview.nvim" },
  { "max397574/better-escape.nvim", enabled = false },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
          :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
          :with_pair(cond.not_before_regex("xxx", 3))
          -- don't move right when repeat character
          :with_move(cond.none())
          -- don't delete if the next character is xx
          :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = {
        auto_refresh = false,
        keymap = {
          accept = "<CR>",
          jump_prev = "[[",
          jump_next = "]]",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          prev = "<M-[>",
          next = "<M-]>",
          dismiss = "<C-]>",
        },
      },
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {},
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send { msg = "{this}" } end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function() require("sidekick.cli").send { msg = "{file}" } end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function() require("sidekick.cli").send { msg = "{selection}" } end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
  {
    "VPavliashvili/json-nvim",
    ft = "json", -- only load for json filetype
  },
  {
    "OXY2DEV/markview.nvim",
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}

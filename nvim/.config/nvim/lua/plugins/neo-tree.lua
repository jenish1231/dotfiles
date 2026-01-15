return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.close_if_last_window = false
    opts.enable_diagnostics = false
    opts.sources = { "filesystem", "git_status" }
    opts.filesystem.filtered_items.hide_gitignored = false
    opts.filesystem.filtered_items.hide_dotfiles = false
    opts.filesystem.follow_current_file.enabled = false

    opts.window.mappings = vim.tbl_extend("force", opts.window.mappings, {
      ["<S-e>"] = "open_vsplit",
    })

    return opts
  end,
}

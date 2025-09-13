local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<S-e>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<S-v>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end


local nvimtree = lvim.builtin.nvimtree


nvimtree.setup.on_attach = my_on_attach
nvimtree.setup.disable_netrw = true
nvimtree.setup.hijack_netrw = true
nvimtree.setup.auto_reload_on_write = true
nvimtree.setup.hijack_directories.enable = false
nvimtree.setup.update_focused_file.enable = false
nvimtree.setup.system_open.cmd = ""

nvimtree.setup.update_focused_file.update_root = true
nvimtree.setup.git.ignore = true
nvimtree.setup.renderer.indent_markers.enable = true

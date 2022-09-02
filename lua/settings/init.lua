local set = vim.opt

set.expandtab = true
set.number = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.signcolumn = 'yes'
set.foldmethod = 'syntax'
set.autoindent = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'UTF-8'
set.cursorline = true
set.background = 'dark'

set.hidden = true
set.mouse = 'a'
set.smartindent = true
set.swapfile = false
set.cursorline = false

vim.g.vim_json_conceal=0
vim.g.python3_host_prog="/opt/homebrew/bin/python3"

vim.opt.termguicolors = true
vim.g.floaterm_keymap_new='<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_toggle = '<F12>'

-- vim.g.catppuccin_flavour = "mocha"

-- vim.g.bettercomments_language_aliases = { "javascript": "js" }

vim.cmd [[ silent! colorscheme doom-one ]]
-- vim.cmd [[ silent! colorscheme catppuccin ]]

local set = vim.opt

set.expandtab = true
set.number = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.signcolumn = 'yes'
set.foldmethod = 'syntax'
-- set.foldlevel = 99
set.autoindent = true
set.foldenable = false

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

set.hidden = true
set.mouse = 'a'
set.smartindent = true
set.swapfile = false
set.cursorline = false

vim.g.vim_json_conceal=0
vim.g.python3_host_prog="/opt/homebrew/bin/python3"

vim.g.floaterm_keymap_new='<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_toggle = '<F12>'

vim.g.transparent_enabled = true

vim.opt.list = true

set.background = 'dark'
vim.opt.termguicolors = true
vim.cmd[[colorscheme themer_astron ]]

-- indent Line Configs
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.opt.list = true
-- End indent line config

vim.g.copilot_assume_mapped=true


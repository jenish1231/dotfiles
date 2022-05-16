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
-- set.clipboard=unnamed
set.cursorline = true

set.hidden = true
set.mouse = 'a'
set.smartindent = true

set.cursorline = false

vim.cmd [[ silent! colorscheme edge ]]
vim.g.vim_json_conceal=0
vim.g.python3_host_prog="/opt/homebrew/bin/python3"


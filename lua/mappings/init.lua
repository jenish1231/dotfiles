local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- map H, J, K ,L to switch between panes
map('n', '<C-H>', '<C-W><C-H>', opts)
-- map('n', '<C-J>', '<C-W><C-J>', opts)
-- map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)

-- map jj to Esc key
map('i', 'jj', '<Esc>', opts)

map('n', '<c-q>', ':noh<CR>', opts)
map('n', '<c-j>', ':m+<CR>', opts)
map('n', '<C-k>', ':m--<CR>', opts)

-- copy to clipboard
map('n', 'Y', '"+yg_', opts)
map('n', 'y', '"+y', opts)
map('n', 'yy', '"+yy', opts)
map('v', 'y', '"+y', opts)

map('n', 'd', '"+d', opts)

-- paste from clipboard
map('n', 'p', '"+p', opts)
map('n', 'P', '"+p', opts)
map('v', 'p', '"+p', opts)
map('v', 'P', '"+P', opts)

-- Telescope
map('n', '<C-p>', ':Telescope git_files<cr>', opts)
map('n', '<C-P>', ':Telescope find_files<cr>', opts)

-- Maximaizer
map('n', '<leader>z', ":MaximizerToggle<cr>", opts)

map('n', '<C-E>', ':NvimTreeToggle<CR>', opts)

-- Ctrl SF
map('n', '<C-F>', ':CtrlSF ', opts)

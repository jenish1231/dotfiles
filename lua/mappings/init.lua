local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- map H, J, K ,L to switch between panes
map('n', '<C-H>', '<C-W><C-H>', opts)
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)

-- map jj to Esc key
map('i', 'jj', '<Esc>', opts)

map('n', '<c-q>', ':noh<CR>', opts)
map('n', '<S-j>', ':m+<CR>', opts)
map('n', '<S-k>', ':m--<CR>', opts)

-- copy to clipboard
map('n', 'Y', '"+yg_', opts)
map('n', 'y', '"+y', opts)
map('n', 'yy', '"+yy', opts)
map('v', 'y', '"+y', opts)

-- cut to clipboard
map('n', 'dd', '"*dd', opts)
map('n', 'dd', '"*dd', opts)
map('v', 'D', '"*D', opts)
map('v', 'D', '"*D', opts)

map('v', 'd', '"*D', opts)

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

-- Bufferline Configs
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)

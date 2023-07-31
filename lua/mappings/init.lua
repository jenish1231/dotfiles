local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- map H, J, K ,L to switch between panes
map('n', '<C-H>', '<C-W><C-H>', opts)
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)

-- Resize buffer mapping
map('n', '<A-S-K>', ':resize -10<CR>', opts)
map('n', '<A-S-J>', ':resize +10<CR>',opts )
map('n', '<A-S-l>', ':vertical resize -10<CR>', opts)
map('n', '<A-S-H>', ':vertical resize +10<CR>', opts)

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

map('n', '<leader>u', ':UndotreeToggle<CR>', opts)

map("n", "gt", ":vert winc ]<CR>", opts)

map('n', '<leader>d', ':DogoGenerate<CR>', opts)

-- Navigation
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

-- Actions
map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

-- Text object
map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)

-- spectre
map('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', opts)
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search()<CR>', opts)

-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})


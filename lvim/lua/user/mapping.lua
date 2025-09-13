lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.normal_mode["<C-q>"] = ":noh<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope git_files<cr>"

lvim.keys.normal_mode["<leader>dfo"] = ":DiffviewOpen<CR>"
lvim.keys.normal_mode["<leader>dfc"] = ":DiffviewClose<CR>"

lvim.keys.normal_mode["<leader>j"] = ":BufferLineCyclePrev <CR>"
lvim.keys.normal_mode["<leader>k"] = ":BufferLineCycleNext <CR>"
lvim.keys.normal_mode["<leader>q"] = ":BufferKill <CR>"


lvim.keys.normal_mode["<leader>S"] = '<cmd>lua require("spectre").open()<CR>'
lvim.keys.normal_mode["<leader>sw"] = '<cmd>lua require("spectre").open_visual({select_word=true})<CR>'
lvim.keys.normal_mode["<leader>sp"] = '<cmd>lua require("spectre").open_file_search()<CR>'

lvim.keys.normal_mode["Y"] = '"+yg_'
lvim.keys.normal_mode["y"] = '"+y'
lvim.keys.normal_mode["yy"] = '"+yy'

lvim.keys.normal_mode["dd"] = '"*dd'
lvim.keys.normal_mode["D"] = '"*D'

lvim.keys.normal_mode["p"] = '"+p'
lvim.keys.normal_mode["P"] = '"+p'

lvim.keys.normal_mode["<S-H>"] = ":TmuxResizeLeft<CR>"
lvim.keys.normal_mode["<S-L>"] = ":TmuxResizeRight<CR>"

lvim.keys.normal_mode["<M-J>"] = ":m++<CR>"
lvim.keys.normal_mode["<M-K>"] = ":m--<CR>"

lvim.builtin.which_key.mappings["f"] = nil
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

lvim.keys.normal_mode["<C-e>"] = nil
lvim.keys.normal_mode["<leader>f"] = "<cmd>lua vim.lsp.buf.format{ async = false }<CR>"
lvim.keys.normal_mode["<leader>o"] = "<cmd>lua vim.lsp.buf.code_action({ source= {organizeImports = true }})<CR>"
lvim.keys.normal_mode["<leader>z"] = "<cmd>lua require('maximizer').toggle()<CR>"
lvim.keys.normal_mode["<leader>d"] = ":DogoGenerate<CR>"
lvim.keys.normal_mode["gt"] = ":vsplit | lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["<space>rn"] = "<cmd>lua vim.lsp.buf.rename()<CR>"
lvim.keys.normal_mode["<C-i>"] = ":CopilotChatToggle<CR>"


vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>")

vim.wo.relativenumber = true

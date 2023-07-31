local lsp_installer = require('nvim-lsp-installer')

-- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

 if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_set_keymap("n", "gt", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format{ async =true }<CR>', opts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver', 'html', 'dockerls', 'jsonls', 'terraformls', 'rust_analyzer'}

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities=capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


require("lspconfig").clangd.setup {
    on_attach = on_attach
}

require'lspconfig'.tsserver.setup{

    on_attach = on_attach,
    capabilities=capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    handlers = {
    ["textDocument/definition"] = function(_, result, params)
      if result == nil or vim.tbl_isempty(result) then
        -- local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
        return nil
      end

      if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1])
        if #result > 1 then
          local isReactDTs = false
          for key, value in pairs(result) do
            if string.match(value.uri, "react/index.d.ts") then
              isReactDTs = true
              break
            end
          end
          if not isReactDTs then
            vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
            vim.api.nvim_command("copen")
          end
        end
      else
        vim.lsp.util.jump_to_location(result)
      end

    end
  };
}


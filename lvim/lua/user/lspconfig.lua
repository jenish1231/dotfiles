local lsp_config = require("lspconfig")
lsp_config.tsserver.setup {
  cmd = { 'typescript-language-server', '--stdio' }
}

lsp_config.terraformls.setup {
  cmd = { "terraform-lsp" },
  filetypes = { "terraform" },
}


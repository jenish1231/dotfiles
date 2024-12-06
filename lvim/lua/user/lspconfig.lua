local lsp_config = require("lspconfig")

lsp_config.ruff_lsp.setup {
  init_options = {
    settings = {
      -- ...
    },
  },
  commands = {
    RuffAutofix = {
      function()
        vim.lsp.buf.execute_command {
          command = 'ruff.applyAutofix',
          arguments = {
            { uri = vim.uri_from_bufnr(0) },
          },
        }
      end,
      description = 'Ruff: Fix all auto-fixable problems',
    },
    RuffOrganizeImports = {
      function()
        vim.lsp.buf.execute_command {
          command = 'ruff.applyOrganizeImports',
          arguments = {
            { uri = vim.uri_from_bufnr(0) },
          },
        }
      end,
      description = 'Ruff: Format imports',
    },
  },
}


-- Pyright setup
lsp_config.pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        exclude = { "build" }
      }
    }
  }
})

-- lsp_config.terraformls.setup {
--   cmd = { "terraform-lsp" },
--   filetypes = { "terraform" },
-- }

local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
  -- disable lsp watcher. Too slow on linux
  wf._watchfunc = function()
    return function() end
  end
end

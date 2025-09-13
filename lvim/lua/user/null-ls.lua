local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    args = { "--print-width", "120" },
    filetypes = { "typescript", "typescriptreact", "javascript" },
  },
  {
    name = "pg_format",
    filetypes = { "sql", "pgsql" }
  },

}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { name = "ruff" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

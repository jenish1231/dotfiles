local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- {
  --   name = "black",
  --   args = { "--line-length", "120" },
  -- },
  {
    name = "prettier",
    args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript" },
  },
  {
    name = "isort",
    filetypes = { "python" }
  },
  {
    name = "pg_format",
    filetypes = { "sql", "pgsql" }
  },
  {
    name = "ruff",
    filetypes = { "python" }
  }

}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "ruff" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.autopep8,
    formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    formatting.prettier,
}

null_ls.setup({
    sources=sources,
    on_attach=on_attach
})

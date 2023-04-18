return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "zls",
                "rust_analyzer",
                "jdtls",
                "pyright",
            },
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            automatic_installation = false,
            automatic_setup = true,
            ensure_installed = { "stylua", "rustfmt" },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            -- ensure_installed = { "python" },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local null_ls = require("null-ls")
            opts.sources = {
                null_ls.builtins.diagnostics.chktex,
            }
            return opts
        end,
    },
}

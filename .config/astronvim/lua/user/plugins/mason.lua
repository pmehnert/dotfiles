return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd", "zls", "rust_analyzer", "ltex" },
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = { "stylua", "rustfmt" },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            -- ensure_installed = { "python" },
        },
    },
}

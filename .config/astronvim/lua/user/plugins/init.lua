return {
    { "joshdick/onedark.vim" },
    { "andweeb/presence.nvim" },
    { "mattn/webapi-vim" },
    { "nyoom-engineering/oxocarbon.nvim" },
    { "folke/tokyonight.nvim" },
    {
        "tpope/vim-surround",
        event = "BufEnter",
    },
    -- TODO { "ziglang/zig.vim" },
    {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        event = "BufEnter",
        config = function() require("trouble").setup({}) end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        opts = function() require("lsp_signature").setup() end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local null_ls = require("null-ls")
            opts.sources = {
                null_ls.builtins.formatting.stylua,
            }
            return opts
        end,
    },
}

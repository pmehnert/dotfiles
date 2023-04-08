return {
    { "ziglang/zig.vim", ft = "zig" },
    { "folke/tokyonight.nvim", lazy = false },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup() end,
    },
    {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        cmd = "Trouble",
        config = function() require("trouble").setup() end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufEnter",
        config = function() require("lsp_signature").setup() end,
    },
}

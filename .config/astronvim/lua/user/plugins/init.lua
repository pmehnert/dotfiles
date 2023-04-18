return {
    { "ziglang/zig.vim", ft = "zig" },
    { "folke/tokyonight.nvim", lazy = true },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup() end,
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = { "Trouble", "TroubleToggle" },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufEnter",
    },
    {
        "wintermute-cell/gitignore.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        cmd = "Gitignore",
    },
}

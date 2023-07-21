return {
    { "ziglang/zig.vim", ft = "zig" },
    { "folke/tokyonight.nvim", lazy = true },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = { "Trouble", "TroubleToggle" },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufEnter",
        opts = { toggle_key = "<M-k>" },
    },
    {
        "wintermute-cell/gitignore.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        cmd = "Gitignore",
    },
    -- todo fixme
    -- {
    --     "simrat39/rust-tools.nvim",
    --     ft = "rust",
    --     opts = function(opts)
    --         local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
    --         local liblldb_path = mason_path
    --             .. "packages/codelldb/extension/lldb/lib/liblldb.so"
    --         local codelldb_path = mason_path .. "bin/codelldb"
    --         opts["dap"] = {
    --             adapter = require("rust-tools.dap").get_codelldb_adapter(
    --                 codelldb_path,
    --                 liblldb_path
    --             ),
    --         }
    --     end,
    --     -- end {
    --     --     dap = {
    --     --         adapter = {
    --     --             adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --     --         }
    --     --     },
    --     -- },
    -- },
}

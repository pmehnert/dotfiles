require("lazy").setup({
    {
        "AstroNvim/AstroNvim",
        version = "^4",
        import = "astronvim.plugins",
        opts = {
            mapleader = " ",
            maplocalleader = ",",
            icons_enabled = true,
            pin_plugins = nil,
        },
    },
    { import = "community" },
    { import = "plugins" },
} --[[@as LazySpec]], {
    install = { colorscheme = { "astrodark", "habamax" } },
    ui = { backdrop = 100 },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            },
        },
    },
} --[[@as LazyConfig]])

return {
    { "AstroNvim/astrotheme", enabled = false },
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            opts.section.header.val = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                "",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
            }
            return opts
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        opts = { enable_autosnippets = true },
        config = function(plugin, opts)
            -- can this be safely removed?
            require("plugins.configs.luasnip")(plugin, opts)

            require("luasnip.loaders.from_lua").lazy_load({
                paths = astronvim.install.config .. "/LuaSnip",
            })
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        build = "./kitty/install-kittens.bash",
        opts = { at_edge = "stop" },
    },
}

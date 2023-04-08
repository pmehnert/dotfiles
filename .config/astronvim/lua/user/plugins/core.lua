return {
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
        "folke/which-key.nvim",
        config = function(plugin, opts)
            require("plugins.configs.which-key")(plugin, opts)
            -- local wk = require("which-key")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            -- can this be safely removed?
            require("plugins.configs.luasnip")(plugin, opts)

            require("luasnip.loaders.from_lua").lazy_load({
                paths = astronvim.install.config .. "/LuaSnip",
            })
        end,
    },
}

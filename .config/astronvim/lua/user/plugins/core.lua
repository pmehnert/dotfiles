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
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require("astronvim.utils.status")
            opts.statusline[3] = status.component.file_info({
                filename = { padding = { right = 1 } },
                filetype = { separator = { left = "[", right = "]" } },
            })
            opts.statusline[9] = status.component.lsp({
                lsp_client_names = {
                    separator = { left = "[", right = "]" },
                    icon = { kind = "None" },
                },
            })

            return opts
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- build = "make install_jsregexp",
        opts = { enable_autosnippets = false },
        config = function(plugin, opts)
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

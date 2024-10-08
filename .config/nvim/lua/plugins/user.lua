---@type LazySpec
return {
    "folke/zen-mode.nvim",

    "Shatur/neovim-ayu",
    { "folke/tokyonight.nvim", enabled = false },
    { "AstroNvim/astrotheme", enabled = false },

    "andweeb/presence.nvim",
    {
        "nvim-telescope/telescope.nvim",
        opts = function(_, opts)
            return require("astrocore").extend_tbl(opts, {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-x>"] = require("trouble.sources.telescope").open,
                            ["<C-X>"] = require("trouble.sources.telescope").add,
                        },
                        n = {
                            ["<C-x>"] = require("trouble.sources.telescope").open,
                            ["<C-X>"] = require("trouble.sources.telescope").add,
                        },
                    },
                },
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        opts = { toggle_key = "<M-k>" },
        config = function() require("lsp_signature").setup() end,
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },

    { "ziglang/zig.vim", ft = "zig" },
    {
        "wintermute-cell/gitignore.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        cmd = "Gitignore",
    },

    { "max397574/better-escape.nvim" },

    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require("astronvim.plugins.configs.luasnip")(plugin, opts)
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        build = "./kitty/install-kittens.bash",
        opts = { at_edge = "stop" },
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Toggle Diagnostics",
            },
            {
                "<leader>xb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Toggle Buffer Diagnostics",
            },
            {
                "<leader>xs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Toggle Symbols",
            },
            {
                "<leader>xl",
                "<cmd>Trouble lsp toggle focus=false<cr>",
                desc = "Toggle LSP Definitions",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Toggle Quickfix List",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        -- opts = {
        --     highlight = {
        --         pattern = [[.*<(KEYWORDS)\s*]],
        --     },
        --     pattern = [[\b(KEYWORDS)\b]],
        -- },
    },

    {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require("astroui.status")
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
        "windwp/nvim-autopairs",
        opts = {
            check_ts = true,
            enable_bracket_in_quote = false,
        },
        config = function(plugin, opts)
            require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts)

            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            local basic = require("nvim-autopairs.rules.basic")

            npairs.add_rule(Rule("$", "$", { "tex", "latex" }))

            -- Suppres brackets pairs for '@(', '@[', and '@{' latex snippets
            local suppress_after_at = function(start_pair, end_pair, builder)
                npairs.remove_rule(start_pair)
                npairs.add_rules({
                    builder(start_pair, end_pair, { "-tex" }),
                    builder(start_pair, end_pair, { "tex" }):with_pair(
                        cond.not_before_text("@"),
                        1
                    ),
                })
            end
            suppress_after_at("(", ")", basic.quote_creator(npairs.config))
            suppress_after_at("{", "}", basic.bracket_creator(npairs.config))
            suppress_after_at("[", "]", basic.bracket_creator(npairs.config))
        end,
    },
}

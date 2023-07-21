return {
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        lazy = false,
        opts = {
            views = {
                cmdline_popup = { position = { row = 8 } },
                popupmenu = { position = { row = 11 } },
            },
            lsp = {
                hover = { enabled = false },
                signature = { enabled = false },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                command_palette = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    view = "mini",
                    filter = {
                        event = "msg_show",
                        kind = "",
                    },
                },
            },
        },
    },
}

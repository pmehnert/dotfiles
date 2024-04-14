---@type LazySpec
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
                cmdline_popup = {
                    position = { row = 8, col = "50%" },
                    size = { width = 60, height = "auto" },
                },
                popupmenu = {
                    relative = "editor",
                    position = { row = 11, col = "50%" },
                    size = { width = 60, height = "auto" },
                    border = { style = "rounded", padding = { 0, 1 } },
                    win_options = {
                        winhighlight = {
                            Normal = "Normal",
                            FloatBorder = "DiagnosticInfo",
                        },
                    },
                },
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
                command_palette = false,
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

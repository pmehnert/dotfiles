return {
    updater = {
        remote = "origin",
        channel = "stable",
        version = "latest",
        branch = "main",
        commit = nil,
        pin_plugins = nil,
        skip_prompts = false,
        show_changelog = true,
    },
    colorscheme = "onedark",
    -- colorscheme = "oxocarbon",
    diagnostics = {
        virtual_text = true,
        underline = true,
    },
    lsp = {
        formatting = {
            format_on_save = {
                enabled = true,
                ignore_filetypes = {},
            },
        },
        ["server-settings"] = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                procMacro = { enable = true },
                updates = { channel = "nightly" },
            },
            texlab = {
                chktex = { onOpenAndSave = false },
            },
        },
    },
    polish = function()
        -- Commands to manage the GUI font at runtime
        local RefreshGuiFont = function()
            vim.opt.guifont =
                string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
        end
        local ResizeGuiFont = function(delta)
            vim.g.gui_font_size = vim.g.gui_font_size + delta
            RefreshGuiFont()
        end
        local ResetGuiFont = function()
            vim.g.gui_font_size = vim.g.gui_font_default_size
            RefreshGuiFont()
        end

        -- Call function on startup to set default value
        ResetGuiFont()

        vim.api.nvim_create_user_command(
            "IncreaseFontSize",
            function() ResizeGuiFont(1) end,
            {}
        )
        vim.api.nvim_create_user_command(
            "DecreaseFontSize",
            function() ResizeGuiFont(-1) end,
            {}
        )
        vim.api.nvim_create_user_command("ResetFontSize", ResetGuiFont, {})

        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
}

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
    lazy = {
        change_detection = { enabled = false },
    },
    colorscheme = "tokyonight-storm",
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
        config = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                procMacro = { enable = true },
                updates = { channel = "nightly" },
            },
            lua_ls = {
                settings = {
                    Lua = { format = { enable = false } },
                },
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

        -- vim.cmd([[
        -- " Use Tab to expand and jump through snippets
        -- imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
        -- smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
        --
        -- " Use Shift-Tab to jump backwards through snippets
        -- imap <silent><expr> jl luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'jl'
        -- smap <silent><expr> jl luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'jl'
        -- ]])
    end,
}

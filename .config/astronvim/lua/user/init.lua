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
                cargo = {
                    extraArgs = "-Ctarget-cpu=native",
                },
            },
            lua_ls = {
                settings = {
                    Lua = { format = { enable = false } },
                },
            },
            clangd = {
                capabilities = { offsetEncoding = "utf-8" },
            },
            texlab = {
                settings = {
                    texlab = {
                        formatterLineLength = 0,
                        latexindent = { modifyLineBreaks = true },
                        build = { onSave = true },
                    },
                },
            },
        },
    },
    polish = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "gitcommit",
            callback = function() vim.opt_local.spell = true end,
        })
    end,
}

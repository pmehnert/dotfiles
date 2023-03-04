-- vim: set shiftwidth=4
--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin",
        channel = "stable",
        version = "latest",
        branch = "main",
        commit = nil,
        pin_plugins = nil,
        skip_prompts = false,
        show_changelog = true,
        -- auto_reload = true,
        -- auto_quit = false,
    },

    -- colorscheme = "default_theme",
    colorscheme = "onedark",
    -- colorscheme = "oxocarbon",

    highlights = {
        default_theme = function(highlights)
            local C = require("default_theme.colors")

            highlights.Normal = { fg = C.fg, bg = C.bg }
            return highlights
        end,
    },

    options = function(local_vim)
        local_vim.opt.relativenumber = true
        local_vim.opt.shortmess = vim.opt.shortmess + { m = true }
        local_vim.opt.cmdheight = 1
        local_vim.opt.showcmd = true
        local_vim.opt.shiftwidth = 4

        -- Configure font face and size (specifically for Neovide)
        local_vim.g.gui_font_default_size = 12
        local_vim.g.gui_font_size = local_vim.g.gui_font_default_size
        local_vim.g.gui_font_face = "JetBrainsMono Nerd Font"

        local_vim.g.onedark_terminal_italics = 1
        local_vim.g.onedark_color_overrides =
        { background = { gui = "#1E222A", cterm = "235", term = "0" } }

        return local_vim
    end,

    -- Set dashboard header
    header = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
    },

    -- Default theme configuration
    default_theme = {
        -- set the highlight style for diagnostic messages
        diagnostics_style = { italic = true },

        -- Modify the color palette for the default theme
        colors = { fg = "#abb2bf", bg = "#1e222a" },

        -- enable or disable highlighting for extra plugins
        plugins = {
            aerial = true,
            beacon = false,
            bufferline = true,
            dashboard = true,
            highlighturl = true,
            hop = false,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = false,
            telescope = true,
            vimwiki = false,
            ["which-key"] = true,
        },
    },

    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            },
        },

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                procMacro = { enable = true },
                updates = { channel = "nightly" },
            },
            ["ltex"] = {
                language = "de-DE",
            },
        },
    },

    mappings = function(maps)
        maps.n["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" }
        maps.n["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" }
        maps.n["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" }
        maps.n["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" }

        maps.n["<C-+>"] = { "<cmd>IncreaseFontSize<cr>", desc = "Increase font size" }
        maps.n["<C-->"] = { "<cmd>DecreaseFontSize<cr>", desc = "Decrease font size" }
        maps.n["<C-0>"] = { "<cmd>ResetFontSize<cr>", desc = "Restore original font size" }

        if astronvim.is_available("toggleterm.nvim") then
            local toggle_term_cmd = astronvim.toggle_term_cmd
            maps.n["<leader>te"] = {
                function()
                    toggle_term_cmd("evcxr")
                end,
                desc = "ToggleTerm evcxr (Rust)",
            }
        end

        if astronvim.is_available("telescope.nvim") then
            maps.n["<leader>le"] = {
                function()
                    require("telescope.builtin").lsp_definitions()
                end,
                desc = "Search definitions",
            }
        end
        return maps
    end,

    -- Configure plugins
    plugins = {
        init = {
            { "tpope/vim-surround" },
            { "joshdick/onedark.vim" },
            { "andweeb/presence.nvim" },

            -- Dependency for :RustPlay
            { "mattn/webapi-vim" },

            { "nyoom-engineering/oxocarbon.nvim" },

            ["ray-x/lsp_signature.nvim"] = {
                event = "BufRead",
                config = function()
                    require("lsp_signature").setup()
                end,
            },
        },
        ["null-ls"] = function(config)
            local null_ls = require("null-ls")
            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                null_ls.builtins.formatting.stylua,
            }

            return config
        end,
        treesitter = {
            ensure_installed = { "lua" },
        },
        ["mason-lspconfig"] = {
            ensure_installed = { "sumneko_lua" },
        },
        packer = {
            compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
        },
        cmp = function(local_cmp)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
                    == nil
            end

            local_cmp.mapping["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s" })
            local_cmp.mapping["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" })
            local_cmp.mapping["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    vim.cmd("echo 'confirm'")
                    cmp.confirm({ select = true })
                elseif luasnip.expand_or_jumpable() then
                    vim.cmd("echo 'jump'")
                    luasnip.jump(1)
                elseif has_words_before() then
                    vim.cmd("echo 'complete'")
                    cmp.complete()
                else
                    vim.cmd("echo 'fallback'")
                    fallback()
                end
            end, { "i", "s" })
            local_cmp.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" })
            local_cmp.mapping["<space>"] = nil

            return local_cmp
        end,
    },

    -- LuaSnip Options
    luasnip = {
        vscode_snippet_paths = {},
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        },
    },

    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },

    ["which-key"] = {
        register_mappings = {
            n = {
                ["<leader>"] = { ["b"] = { name = "Buffer" } },
                ["d"] = { ["s"] = { name = "Delete surroundings" } },
                ["c"] = {
                    ["s"] = { name = "Change surroundings" },
                    ["S"] = { name = "Change surroundings [NL]" },
                },
                ["y"] = {
                    ["s"] = { name = "Surround with", s = "Surround line" },
                    ["S"] = { name = "Surround with [NL]" },
                },
            },
            v = {
                ["S"] = { name = "Surround selection" },
                ["g"] = { ["S"] = { name = "Surround selection (no indent)" } },
            },
        },
    },

    polish = function()
        vim.api.nvim_create_augroup("packer_conf", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePost", {
            desc = "Sync packer after modifying plugins.lua",
            group = "packer_conf",
            pattern = "plugins.lua",
            command = "source <afile> | PackerSync",
        })

        -- Commands to manage the GUI font at runtime
        RefreshGuiFont = function()
            vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
        end

        ResizeGuiFont = function(delta)
            vim.g.gui_font_size = vim.g.gui_font_size + delta
            RefreshGuiFont()
        end

        ResetGuiFont = function()
            vim.g.gui_font_size = vim.g.gui_font_default_size
            RefreshGuiFont()
        end

        -- Call function on startup to set default value
        ResetGuiFont()

        vim.api.nvim_create_user_command("IncreaseFontSize", function()
            ResizeGuiFont(1)
        end, {})
        vim.api.nvim_create_user_command("DecreaseFontSize", function()
            ResizeGuiFont(-1)
        end, {})
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

return config

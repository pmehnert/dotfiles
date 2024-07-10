-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

-- helper function to create buffer picker callbacks
local function buffer_picker(callback)
    return function() require("astroui.status.heirline").buffer_picker(callback) end
end

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        features = {
            large_buf = { size = 1024 * 500, lines = 10000 },
            autopairs = true,
            cmp = true,
            diagnostics_mode = 2,
            highlighturl = true,
            notifications = true,
        },
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        options = {
            opt = {
                relativenumber = true,
                number = true,
                signcolumn = "yes:1",
                wrap = false,
                showcmd = true,
                shiftwidth = 4,
                tabstop = 4,
                cmdheight = 0,
            },
            g = {
                autoformat_enabled = true,
                autopairs_enabled = true,
                icons_enabled = true,
                ui_notifications_enabled = true,
            },
        },
        mappings = {
            n = {
                ["<Leader>Q"] = { "<cmd>confirm qa<cr>", desc = "Quit All" },
                ["<Leader>te"] = {
                    function() require("astronvim.utils").toggle_term_cmd("evcxr") end,
                    desc = "ToggleTerm evcxr (Rust)",
                },
                ["<Leader>le"] = {
                    function() require("telescope.builtin").lsp_definitions() end,
                    desc = "Search definitions",
                },

                -- navigate buffer tabs with `H` and `L`
                L = {
                    function() require("astrocore.buffer").nav(vim.v.count1) end,
                    desc = "Next buffer",
                },
                H = {
                    function() require("astrocore.buffer").nav(-vim.v.count1) end,
                    desc = "Previous buffer",
                },

                -- bindings related to navigating buffers
                ["<Leader>b"] = { desc = "Buffers" },
                ["<Leader>bD"] = {
                    buffer_picker(
                        function(bufnr) require("astrocore.buffer").close(bufnr) end
                    ),
                    desc = "Pick to close",
                },
                ["<Leader>bv"] = {
                    buffer_picker(function(bufnr)
                        vim.cmd.vsplit()
                        vim.api.nvim_win_set_buf(0, bufnr)
                    end),
                    desc = "Split buffer vertical",
                },
                ["<Leader>bh"] = {
                    buffer_picker(function(bufnr)
                        vim.cmd.split()
                        vim.api.nvim_win_set_buf(0, bufnr)
                    end),
                    desc = "Split buffer horizontal",
                },
                ["<Leader>bt"] = {
                    buffer_picker(function(bufnr) vim.cmd.tabnew("#" .. bufnr) end),
                    desc = "Open buffer in new tab",
                },

                -- Category for 'Trouble.nvim' bindings
                ["<Leader>x"] = { name = "Trouble" },
            },
        },
    },
}

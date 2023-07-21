local function buffer_picker(callback)
    return function() require("astronvim.utils.status").heirline.buffer_picker(callback) end
end

return {
    n = {
        ["<leader>Q"] = { "<cmd>confirm qa<cr>", desc = "Quit All" },
        ["<leader>b|"] = false,
        ["<leader>b\\"] = false,
        ["<leader>bv"] = {
            buffer_picker(function(bufnr)
                vim.cmd.vsplit()
                vim.api.nvim_win_set_buf(0, bufnr)
            end),
            desc = "Split buffer vertical",
        },
        ["<leader>bh"] = {
            buffer_picker(function(bufnr)
                vim.cmd.split()
                vim.api.nvim_win_set_buf(0, bufnr)
            end),
            desc = "Split buffer horizontal",
        },
        ["<leader>bt"] = {
            buffer_picker(function(bufnr) vim.cmd.tabnew("#" .. bufnr) end),
            desc = "Open buffer in new tab",
        },
        ["<C-n>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
        ["<C-m>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
        ["<leader>te"] = {
            function() require("astronvim.utils").toggle_term_cmd("evcxr") end,
            desc = "ToggleTerm evcxr (Rust)",
        },
        ["<leader>le"] = {
            function() require("telescope.builtin").lsp_definitions() end,
            desc = "Search definitions",
        },
        -- Bindings for 'Trouble.nvim'
        ["<leader>x"] = { name = "Trouble" },
        ["<leader>xx"] = {
            "<cmd>TroubleToggle<cr>",
            desc = "Toggle Diagnostics",
            noremap = true,
        },
        ["<leader>xw"] = {
            "<cmd>TroubleToggle workspace_diagnostics<cr>",
            desc = "Workspace Diagnostics",
        },
        ["<leader>xd"] = {
            "<cmd>TroubleToggle document_diagnostics<cr>",
            desc = "Document Diagnostics",
        },
        ["<leader>xq"] = {
            "<cmd>TroubleToggle quickfix<cr>",
            desc = "Toggle Quickfix",
        },
        ["<leader>xr"] = {
            "<cmd>TroubleToggle lsp_references<cr>",
            desc = "LSP References",
        },
        ["<leader>xt"] = {
            "<cmd>TroubleToggle lsp_type_definitions<cr>",
            desc = "Type Definitions",
        },
    },
}

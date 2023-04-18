local function luasnip_jump(amount)
    return function()
        local luasnip = require("luasnip")
        if luasnip.jumpable(amount) then luasnip.jump(amount) end
    end
end

return {
    n = {
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        ["<C-+>"] = { "<cmd>IncreaseFontSize<cr>", desc = "Increase Font Size" },
        ["<C-->"] = { "<cmd>DecreaseFontSize<cr>", desc = "Decrease Font Size" },
        ["<C-0>"] = { "<cmd>ResetFontSize<cr>", desc = "Restore Original Font Size" },
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
    i = {
        ["jk"] = { luasnip_jump(1), noremap = false },
        ["jl"] = { luasnip_jump(-1) },
    },
    s = {
        ["jk"] = { luasnip_jump(1), noremap = false },
        ["jl"] = { luasnip_jump(-1) },
    },
}

---@type LazySpec
return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local function has_words_before()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            opts.mapping["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s" })
            opts.mapping["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" })
            opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" })
            opts.mapping["<space>"] = nil
            opts.mapping["<S-Tab>"] = nil

            -- This is all exceptionally awful
            local function put_text(text)
                local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { text })
                vim.api.nvim_win_set_cursor(0, { row, col + #text })
            end

            opts.mapping["jk"] = cmp.mapping(function()
                if luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                else
                    put_text("jk")
                end
            end, { "i", "s" })
            opts.mapping["jl"] = cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    put_text("jl")
                end
            end, { "i", "s" })

            return opts
        end,
    },
}

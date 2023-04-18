return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local has_words_before = function()
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
                -- elseif luasnip.expand_or_jumpable() then
                --     luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" })
            opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" })
            opts.mapping["<space>"] = nil

            return opts
        end,
    },
}

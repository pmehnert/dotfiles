return {
    {
        "windwp/nvim-autopairs",
        opts = {
            check_ts = true,
            enable_bracket_in_quote = false,
        },
        config = function(plugin, opts)
            require("plugins.configs.nvim-autopairs")(plugin, opts)

            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            local basic = require("nvim-autopairs.rules.basic")

            npairs.add_rule(Rule("$", "$", { "tex", "latex" }))

            -- Suppres brackets pairs for '@(', '@[', and '@{' latex snippets
            local suppress_after_at = function(start_pair, end_pair, builder)
                npairs.remove_rule(start_pair)
                npairs.add_rules({
                    builder(start_pair, end_pair, { "-tex" }),
                    builder(start_pair, end_pair, { "tex" }):with_pair(
                        cond.not_before_text("@"),
                        1
                    ),
                })
            end
            suppress_after_at("(", ")", basic.quote_creator(npairs.config))
            suppress_after_at("{", "}", basic.bracket_creator(npairs.config))
            suppress_after_at("[", "]", basic.bracket_creator(npairs.config))
        end,
    },
}

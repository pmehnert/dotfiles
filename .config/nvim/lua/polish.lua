-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function() vim.opt_local.spell = true end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client and client.name == "rust_analyzer" then
--             -- vim.lsp.inlay_hint.enable(args.buf, true)
--         end
--     end,
-- })

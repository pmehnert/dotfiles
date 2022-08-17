local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

require('lean').setup{
  lsp = { on_attach = on_attach },

  ft = {
    default = "lean",
    nomodifiable = { }
  },

  abbreviations = {
    builtin = true, -- built-in expander
    compe = false, -- nvim-compe source
    extra = {
      -- wknight = '♘',
    },
    -- leader = '\\',
    leader = '#',
  },

  mappings = false,

  -- Infoview support
  infoview = {
    autoopen = true,

    width = 50,
    height = 20,

    horizontal_position = "bottom",

    -- Show indicators for pin locations when entering an infoview window?
    -- always | never | auto (= only when there are multiple pins)
    indicators = "auto",
  },

  progress_bars = {
    enable = true,
    priority = 10,
  },

  stderr = {
    enable = true,
    on_lines = nil,
  },
}

local settings = {
    ["rust-analyzer"] = {
        assist = {
            importGranularity = "module",
            importPrefix = "by_self",
        },
        cargo = { loadOutDirsFromCheck = true },
        procMacro = { enable = true },
        updates = { channel = "nightly" },
    }
}

local servers = { 'clangd', 'pyright', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
        settings = settings,
    }
end


-- luasnip setup
local luasnip = require('luasnip')


-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    completion = {
        autocomplete = false,
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}


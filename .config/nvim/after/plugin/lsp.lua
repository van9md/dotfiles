
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {"gopls","pyright"},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
  
})
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<A-y>'] = cmp.mapping.confirm({select = false}),
    ['<A-e>'] = cmp.mapping.abort(),
    ['<A-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<A-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    --['<C-p>'] = cmp.mapping(function()
      --if cmp.visible() then
        --cmp.select_prev_item({behavior = 'insert'})
      --else
        --cmp.complete()
      --end
    --end),
   -- ['<C-n>'] = cmp.mapping(function()
     -- if cmp.visible() then
       -- cmp.select_next_item({behavior = 'insert'})
      --else
        --cmp.complete()
      --end
    --end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})


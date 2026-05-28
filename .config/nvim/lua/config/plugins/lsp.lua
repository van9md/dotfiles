return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.o.autocomplete = true

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP Hover Docs' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Go to References' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP Rename' })
      end,
    })

    vim.lsp.enable({
      'gopls',
      'pyright',
      'html',
    })

    vim.diagnostic.config({
      virtual_text = { prefix = '●' },
      float = { border = 'rounded' },
    })

    vim.lsp.inlay_hint.enable(true)
  end,
}


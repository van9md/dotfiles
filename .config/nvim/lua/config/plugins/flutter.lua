return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- для UI
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = "/home/van9/files/code/flutter/flutter/bin/flutter",
      lsp = {
        cmd = {
          "/home/van9/files/code/flutter/flutter/bin/cache/dart-sdk/bin/dart",
          "language-server",
          "--protocol=lsp",
        },
        on_attach = function(_, bufnr)
          -- стандартные биндинги LSP
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
      },
    })
  end,
}


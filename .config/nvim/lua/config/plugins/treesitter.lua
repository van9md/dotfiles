return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Языки для установки
      require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "toml",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      })

      -- Автостарт treesitter для файлов
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

--      -- folds
--      vim.api.nvim_create_autocmd("FileType", {
--        callback = function()
--          vim.wo.foldmethod = "expr"
--          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--        end,
--      })

      -- indentation (experimental)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}

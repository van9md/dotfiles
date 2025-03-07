return {
    {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "van9",
        path = "~/files/Obsidian/obsidian_van9",
      },
    },
  },
    -- see below for full list of options 👇
    vim.keymap.set("n", "<leader>fn", "<cmd>ObsidianQuickSwitch<CR>", { noremap = true, silent = true })
}
}

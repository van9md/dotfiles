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
        name = "brain",
        path = "~/files/Obsidian/brain",
      },
    },
    note_id_func = function(title)
    return title
    end,
  },
    -- see below for full list of options 👇
    vim.keymap.set("n", "<leader>fn", "<cmd>ObsidianQuickSwitch<CR>", { noremap = true, silent = true })
}
}

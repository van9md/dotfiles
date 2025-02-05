vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<C-d","<C-d>zz")
vim.keymap.set("n","<C-u","<C-u>zz")
vim.keymap.set("n","<leader>e",vim.diagnostic.open_float)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



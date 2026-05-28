return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = {},
                    shortcut = {
                        {
                            icon = '󰮗',
                            desc = 'FZF',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                    },
                    footer={},
                    packages = { enable = false },
                },
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    }
}

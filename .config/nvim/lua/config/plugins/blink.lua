return {
    {
        'saghen/blink.cmp',
        version = '*', -- Использует стабильные релизы
        opts = {
            keymap = { preset = 'default' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            -- Добавьте этот блок:
            completion = {
                documentation = {
                    auto_show = true,          -- Показывать автоматически
                    auto_show_delay_ms = 200,   -- Задержка перед показом в миллисекундах
                },
            }

        }
    }
}

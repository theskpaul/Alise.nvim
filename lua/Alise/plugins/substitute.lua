return {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local substitute = require("substitute")
        substitute.setup()

        -- Set Keymaps
        local keymap = vim.keymap

        -- Divya

        -- Hello, I'm Divya Paul
        -- I'm a Computer Science student.

        keymap.set('n', 's', substitute.operator, { desc = 'Substitute with motion' })
        keymap.set('n', 'ss', substitute.line, { desc = 'Substitute line' })
        keymap.set('n', 'S', substitute.eol, { desc = 'Substitute to end of the line' })
        keymap.set('x', 's', substitute.visual, { desc = 'Substitute in visual mode' })
    end
}

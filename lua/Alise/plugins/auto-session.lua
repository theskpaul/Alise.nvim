return {
    'rmagatti/auto-session',
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enable = false,
            auto_session_suppress_dir = { '~/', '~/Desktop' , '~/Documents', '~/Downloads', '~/Books', '~/Music', '~/Videos'},
        })
    end,
}

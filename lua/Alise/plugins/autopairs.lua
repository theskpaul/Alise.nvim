return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local autopairs = require("nvim-autopairs")

        -- Configure autopairs
        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = {'string'},-- it will not add a pair on that treesitter node
                javascript = {'template_string'},
                java = false,-- don't check treesitter on java
            }
        })

        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- Make autopairs & completion works together
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}

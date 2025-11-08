return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    tag = "*",
    config = "*",
    keys = {
        {
            "<C-\\>",
            "<cmd>ToggleTerm size=40 direction=float<cr>",
            desc = "Open a floating terminal at the Desktop directory",
        },
    },
}

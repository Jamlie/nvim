local options = {
    flavour = "macchiato",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    float = {
        transparent = true, -- enable transparent floating windows
        solid = false,      -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
}

return { {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = options,
    config = function(_, opts)
        require("catppuccin").setup(opts)

        vim.cmd.colorscheme("catppuccin")
    end,
} }

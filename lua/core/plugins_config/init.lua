require("core.plugins_config.onedark")
require("core.plugins_config.lualine")
require("core.plugins_config.nvim-tree")
require("core.plugins_config.treesitter")
require("core.plugins_config.telescope")
require("core.plugins_config.lspconfig")
require("core.plugins_config.completions")
local keys = require("core.plugins_config.which-key")

local wk = require("which-key")

wk.register(keys)

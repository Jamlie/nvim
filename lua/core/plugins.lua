-- local overrides = require("core.config.ai.copilot")

local plugins = {

	-- Custom Parameters (with defaults)
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "llama3.2:latest", -- The default model to use.
			quit_map = "q", -- set keymap to close the response window
			retry_map = "<c-r>", -- set keymap to re-send the current prompt
			accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
			host = "localhost", -- The host running the Ollama service.
			port = "11434", -- The port on which the Ollama service is listening.
			display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
			show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			file = false, -- Write the payload to a temporary file to keep the command short.
			hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
			-- init = function(_options)
			-- 	pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			-- end,
			-- Function to initialize Ollama
			command = function(options)
				local body = { model = options.model, stream = true }
				return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			result_filetype = "markdown", -- Configure filetype of the result buffer
			debug = false, -- Prints errors and the command which is run.
		},
	},

	-- file-tree
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- nvim icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("core.config.ui.nvim-web-devicons").setup()
		end,
	},

	-- nvim tree
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- markdown
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- highlight the same word
	"RRethy/vim-illuminate",

	"nvim-lua/plenary.nvim",

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- diagnostics
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- blankline when indenting
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		opts = {},
	},

	-- copilot
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "InsertEnter",
	-- 	opts = overrides.copilot,
	-- },

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("core.config.essentials.which-key").setup()
		end,
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	-- comments gcc gc...
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},

	-- telescope
	"nvim-telescope/telescope-ui-select.nvim",
	event = "VeryLazy",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- autopairs () {} [] '' "" ``
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- terminal
	{
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
	},

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		-- branch = "harpoon2",
		event = "BufRead",
	},

	-- dart
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		config = true,
	},

	-- golang
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	-- {
	-- 	"Jay-Madden/auto-fix-return.nvim",
	-- 	config = function()
	-- 		require("auto-fix-return").setup({})
	-- 	end,
	-- },

	-- change how things look
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- git
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup()
		end,
	},
	"tpope/vim-fugitive",

	-- lsp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			-- auto_install = true,
		},
	},
	"neovim/nvim-lspconfig",
	"windwp/nvim-ts-autotag",
	{ "folke/neodev.nvim", opts = {} },

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"gopls",
				"rust_analyzer",
				"html",
				"pyright",
				"codelldb",
				"delve",
				"goimports",
				"gofumpt",
				"golines",
			},
		},
	},

	-- colors
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- formatter
	{
		"nvimtools/none-ls.nvim",
		event = "BufRead",
		ft = "go",
		opts = function()
			return require("core.config.essentials.none-ls")
		end,
	},

	-- templ
	{
		"vrischmann/tree-sitter-templ",
		event = "BufRead",
		config = function()
			require("core.config.essentials.treesitter")
		end,
	},

	-- rust
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^3",
	-- 	ft = { "rust" },
	-- 	keys = {
	-- 		{
	-- 			"K",
	-- 			"<cmd>RustLsp hover actions<cr>",
	-- 			desc = "Rust Hover Actions",
	-- 		},
	-- 	},
	-- },

	-- Dap
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("core.config.dap.js")
		end,
	},
	{ "nvim-neotest/nvim-nio" },

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dapui").setup()
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},

		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},

				delve = {
					path = "dlv",
					initialize_timeout_sec = 20,
					port = 6009,
					args = {},
					build_flags = "",
				},
			})
		end,
	},

	-- undo tree
	"mbbill/undotree",

	-- tmux
	"christoomey/vim-tmux-navigator",
}

local custom = require("custom.override")
if custom.plugins then
	for _, plugin in ipairs(custom.plugins) do
		table.insert(plugins, plugin)
	end
end

local opts = {}

return plugins, opts

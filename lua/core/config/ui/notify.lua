local M = {}

function M.setup()
	local icons = styles.style.icons
	local notify = require("notify")

	notify.setup({
		fps = 300,
		timeout = 3000,
		stages = "fade",
		top_down = true,
		background_colour = "#000000",
		icons = {
			ERROR = icons.diagnostics.error,
			WARN = icons.diagnostics.warn,
			INFO = icons.diagnostics.info,
			DEBUG = icons.diagnostics.debug,
			TRACE = icons.diagnostics.trace,
		},
		max_width = function()
			return math.floor(vim.o.columns * 0.5)
		end,
		max_height = function()
			return math.floor(vim.o.columns * 0.9)
		end,
		render = function(...)
			local notification = select(2, ...)
			local style = notification.title[1] == "" and "minimal" or "default"
			require("notify.render")[style](...)
		end,
	})
	vim.notify = notify
end

return M

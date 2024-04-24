local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

local opts = {
	sources = {
		-- go
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,

		-- js
		null_ls.builtins.formatting.prettier,

		-- lua
		null_ls.builtins.formatting.stylua,

		-- dart
		null_ls.builtins.formatting.dart_format,
	},
	on_attach = on_attach,
}

vim.cmd([[autocmd BufWritePre *.rs lua vim.lsp.buf.format({ async = false })]])

return opts

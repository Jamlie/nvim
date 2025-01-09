require("neodev").setup()

local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"gopls",
		"rust_analyzer",
		"pyright",
		"html",
		-- "codelldb",
		-- "delve",
		-- "goimports",
		-- "gofumpt",
		-- "golines",
	},
})

local on_attach = function(client, _)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "L", vim.lsp.diagnostic.set_loclist, { silent = true })

	local active_clients = vim.lsp.get_active_clients()
	if client.name == "denols" then
		for _, client_ in pairs(active_clients) do
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		for _, client_ in pairs(active_clients) do
			if client_.name == "denols" then
				client.stop()
			end
		end
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function(filename, _)
		local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
		if denoRootDir then
			return nil
		end

		return lspconfig.util.root_pattern("package.json")(filename)
	end,
	single_file_support = false,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.zls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ", "astro" },
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "templ", "astro", "javascript", "typescript", "react", "typescriptreact", "javascriptreact", "html" },
	settings = {
		tailwindCSS = {
			includeLanguages = {
				templ = "html",
			},
		},
	},
})

lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.templ.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = { "templ" },
})

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dartls.setup({
	on_attach = on_attach,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.angularls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.sqlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.gleam.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.denols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	init_options = {
		lint = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://cdn.nest.land"] = true,
					["https://crux.land"] = true,
				},
			},
		},
	},
})

-- lspconfig.volar.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
-- })

lspconfig.astro.setup({})

return {
	on_attach = on_attach,
}

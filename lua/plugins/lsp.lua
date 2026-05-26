local desired = {
	-- Rustaceanvim does rust_analyzer
	"lua_ls",
	"tinymist",
	"nil_ls",
	"sqls",
	"ty",
}

local IS_NIX = vim.env["NIX_USER_PROFILE_DIR"] ~= nil
local ensure_installed = IS_NIX and {} or desired
vim.lsp.enable(desired)

return {
	{
		"mason-org/mason.nvim",
		enabled = not IS_NIX,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = not IS_NIX,
		opts = {
			ensure_installed = ensure_installed,
			automatic_enable = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall","LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			-- Stuff that only works when there is an active LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
					-- MOVED TO SNACKS PICKER
					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
					vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
				end
			})
		end
	}
}

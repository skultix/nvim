return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "/", },
		bypass_save_filetypes = { "dashboard", "snacks_dashboard", },
		session_lens = {
			picker = "snacks",
		},
	},

	keys = {
		{ "<leader>ss", "<cmd>AutoSession save<CR>", desc = "AutoSession: save" },
		{ "<leader>sf", "<cmd>AutoSession search<CR>", desc = "AutoSession: search" },
		{ "<leader>sd", "<cmd>AutoSession delete<CR>", desc = "AutoSession: save" },
	}
}

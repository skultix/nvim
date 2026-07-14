return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = false;
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope" },
		opts = {
			mappings = {
				n = {
					["q"] = require("telescope.actions").close
				}
			},

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown{}
				}
			}
		},
		keys = {
			-- { "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find_files" },
			-- { "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope live_grep" },
			-- { "<leader>fz", require("telescope.builtin").current_buffer_fuzzy_find, desc = "Telescope current_buffer_fuzzy_find" },
			-- { "<leader>fd", require("telescope.builtin").diagnostics, desc = "Telescope diagnostics" },
			-- { "<leader>fb", require("telescope.builtin").buffers, desc = "Telescope buffers" },
			-- { "<leader>fh", require("telescope.builtin").highlights, desc = "Telescope highlights" },
			-- { "<leader>fm", require("telescope.builtin").marks, desc = "Telescope marks" },
		},
		init = function()
			vim.api.nvim_create_user_command(
				"Colorschemes",
				function() require("telescope.builtin").colorscheme() end,
				{ nargs = 0 }
			)
		end
	},

	-- PLUGINS
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end
	},
    {
        "matkrin/telescope-spell-errors.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		event = "VeryLazy",
        config = function()
            require("telescope").load_extension("spell_errors")
        end,
		keys = {
			{ "<leader>fS", function() require("telescope").extensions.spell_errors.spell_errors() end, desc = "Telescope spelling errors" }
		},
    }
}

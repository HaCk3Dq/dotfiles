return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	config = function()
		require("telescope").load_extension("fzy_native")
		require("telescope").load_extension("session-lens")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				prompt_prefix = "λ -> ",
				selection_caret = "> ",
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})
	end,
}

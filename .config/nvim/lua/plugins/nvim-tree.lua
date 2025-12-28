-- ============================================================================
-- NVIM-TREE
-- ============================================================================
-- File explorer tree for Neovim
-- Provides a sidebar file browser with tree structure
-- Keymap: Ctrl+n - Toggle file tree

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",  -- Use latest stable version
	lazy = false,   -- Load on startup
	dependencies = {
		"nvim-tree/nvim-web-devicons",  -- Optional file icons
	},
	config = function()
		require("nvim-tree").setup {
			-- Sort files case-sensitively
			sort_by = "case_sensitive",

			-- Window configuration
			view = {
				width = 30,  -- Sidebar width in characters
			},

			-- Auto-update focused file in tree
			update_focused_file = {
				enable = true,
			},

			-- Display configuration
			renderer = {
				group_empty = true,  -- Group empty folders
				icons = {
					show = {
						file = false,          -- Don't show file icons
						folder = false,        -- Don't show folder icons
						folder_arrow = true,   -- Show arrows for folders
					},
				},
			},

			-- Actions configuration
			actions = {
				open_file = {
					quit_on_open = true,  -- Close tree when opening a file
				},
			},

			-- Filter configuration
			filters = {
				dotfiles = true,  -- Hide dotfiles by default
			},
		}

		-- Toggle nvim-tree with Ctrl+n
        vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
	end,
}

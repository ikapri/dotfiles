-- ============================================================================
-- NVIM-TREESITTER
-- ============================================================================
-- Advanced syntax highlighting using tree-sitter parsers
-- Provides better syntax highlighting, indentation, and code understanding
-- Parsers installed: C, Vim, Vimdoc, Query, Markdown, Go

return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',  -- Use master branch for latest features
	lazy = false,       -- Load on startup
	build = ":TSUpdate", -- Update parsers on install/update
	config = function()
		require'nvim-treesitter.configs'.setup {
			-- List of parsers to always have installed
			ensure_installed = {
				"c",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"go"  -- Primary language focus
			},

			-- Install parsers synchronously (only for ensure_installed)
			sync_install = false,

			-- Automatically install missing parsers when opening files
			auto_install = true,

			-- Treesitter-based indentation
			indent = {
				enable = true,
			},

			-- Syntax highlighting configuration
			highlight = {
				enable = true,  -- Enable treesitter-based highlighting

				-- Disable for specific languages if needed
				-- disable = { "go" },

				-- Don't use regex-based highlighting (treesitter is better)
				additional_vim_regex_highlighting = false,
			},
		}
	end,
}


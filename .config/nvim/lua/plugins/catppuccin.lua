-- ============================================================================
-- CATPPUCCIN COLORSCHEME
-- ============================================================================
-- A soothing pastel theme with warm colors
-- Priority 1000 ensures it loads before other plugins that might depend on colors

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000  -- Load first to ensure colors are available
	},
}

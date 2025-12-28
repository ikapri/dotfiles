-- ============================================================================
-- NVIM-TMUX NAVIGATION
-- ============================================================================
-- Seamless navigation between Neovim splits and tmux panes
-- Uses the same keybindings for both Neovim and tmux
-- Keymaps:
--   Ctrl+h - Navigate left
--   Ctrl+j - Navigate down
--   Ctrl+k - Navigate up
--   Ctrl+l - Navigate right
--   Ctrl+\ - Navigate to last active pane
--   Ctrl+Space - Navigate to next pane

return {
	'alexghergh/nvim-tmux-navigation',
	config = function()
		local nvim_tmux_nav = require('nvim-tmux-navigation')

		nvim_tmux_nav.setup {
			-- Disable navigation when tmux pane is zoomed
			disable_when_zoomed = true
		}

		-- Navigation keymaps (work in both Neovim splits and tmux panes)
		vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
		vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
	end
}

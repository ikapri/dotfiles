-- ============================================================================
-- FZF - FUZZY FINDER
-- ============================================================================
-- Blazing fast fuzzy finder for files, buffers, and more
-- Keymap: Ctrl+f - Search files in current directory
-- Requires fzf binary to be installed on the system

return {
	'junegunn/fzf.vim',
	dependencies = {'junegunn/fzf'},  -- Core fzf binary
	build = ':call fzf#install',      -- Install fzf binary if not present
    config = function()
        -- Fuzzy search files with Ctrl+f
        vim.keymap.set("n", "<C-f>", ":Files<CR>")
    end,
}

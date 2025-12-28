-- ============================================================================
-- BUFEXPLORER
-- ============================================================================
-- Buffer management and switching utility
-- Provides an interactive buffer list for easy navigation
-- Keymap: <leader>o - Open buffer explorer

return {
    "jlanzarotta/bufexplorer",
    config = function()
        -- Open BufExplorer with leader+o
        vim.keymap.set("n", "<leader>o", ":BufExplorer<cr>")
    end,
}


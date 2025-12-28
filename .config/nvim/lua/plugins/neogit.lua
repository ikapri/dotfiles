-- ============================================================================
-- NEOGIT
-- ============================================================================
-- Magit-like Git interface for Neovim
-- Full-featured Git client with interactive staging, committing, and more
-- Keymap: <leader>gg - Open Neogit

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- Required dependency
        "sindrets/diffview.nvim",        -- Optional: better diff viewing
        "nvim-telescope/telescope.nvim", -- Optional: for telescope integration
    },
    config = function()
        local neogit = require('neogit')

        neogit.setup {
            -- Neogit configuration
            kind = "split",  -- "tab", "split", "split_above", "vsplit", "floating"

            -- Commit editor configuration
            commit_editor = {
                kind = "split",
            },

            -- Signs in the gutter
            signs = {
                -- { CLOSED, OPENED }
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },

            -- Integrations
            integrations = {
                diffview = true,  -- Enable diffview integration
                telescope = true, -- Enable telescope integration
            },

            -- Sections configuration
            sections = {
                untracked = {
                    folded = false,  -- Show untracked files expanded
                    hidden = false,  -- Show untracked section
                },
                unstaged = {
                    folded = false,  -- Show unstaged changes expanded
                    hidden = false,  -- Show unstaged section
                },
                staged = {
                    folded = false,  -- Show staged changes expanded
                    hidden = false,  -- Show staged section
                },
                stashes = {
                    folded = true,   -- Show stashes collapsed
                    hidden = false,  -- Show stashes section
                },
                unpulled_upstream = {
                    folded = true,   -- Show unpulled commits collapsed
                    hidden = false,  -- Show unpulled section
                },
                unmerged_upstream = {
                    folded = false,  -- Show unmerged changes expanded
                    hidden = false,  -- Show unmerged section
                },
                unpulled_pushRemote = {
                    folded = true,
                    hidden = false,
                },
                unmerged_pushRemote = {
                    folded = false,
                    hidden = false,
                },
                recent = {
                    folded = true,   -- Show recent commits collapsed
                    hidden = false,  -- Show recent section
                },
                rebase = {
                    folded = true,
                    hidden = false,
                },
            },
        }

        -- Keymaps
        vim.keymap.set("n", "<leader>gg", neogit.open, { desc = "Open Neogit" })
        vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { desc = "Neogit commit" })
        vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { desc = "Neogit pull" })
        vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { desc = "Neogit push" })
    end
}

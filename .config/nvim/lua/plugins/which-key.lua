-- ============================================================================
-- WHICH-KEY
-- ============================================================================
-- Displays a popup with available keybindings as you type
-- Shows all possible completions for partial key sequences
-- Helps discover and remember keybindings

--return {
--    'folke/which-key.nvim',
--    event = "VeryLazy",  -- Load after startup for better performance
--    config = function()
--        local wk = require("which-key")
--
--        wk.setup {
--            plugins = {
--                marks = true,     -- Show marks
--                registers = true, -- Show registers
--                spelling = {
--                    enabled = true,   -- Show spelling suggestions
--                    suggestions = 20, -- Number of suggestions
--                },
--                presets = {
--                    operators = true,    -- Help for operators like d, y, c
--                    motions = true,      -- Help for motions
--                    text_objects = true, -- Help for text objects like iw, aw
--                    windows = true,      -- Help for window commands
--                    nav = true,          -- Help for navigation
--                    z = true,            -- Help for folds, spelling, etc.
--                    g = true,            -- Help for g commands
--                },
--            },
--            -- Popup settings
--            window = {
--                border = "rounded",   -- none, single, double, shadow, rounded
--                position = "bottom",  -- bottom, top
--                margin = { 1, 0, 1, 0 },
--                padding = { 1, 2, 1, 2 },
--            },
--            layout = {
--                height = { min = 4, max = 25 },
--                width = { min = 20, max = 50 },
--                spacing = 3,
--                align = "left",
--            },
--        }
--
--        -- Register key group labels for better organization
--        wk.register({
--            h = { name = "Git Hunks" },
--            x = { name = "Trouble/Diagnostics" },
--            c = { name = "Code/LSP" },
--            t = { name = "Toggle" },
--            l = { name = "LSP" },
--            w = { name = "Save file" },
--            o = { name = "Buffer explorer" },
--            y = { name = "Yank to clipboard" },
--            Y = { name = "Yank line to clipboard" },
--            d = { name = "Delete to black hole" },
--            p = { name = "Paste without yank" },
--            ["<leader>"] = { name = "Source current file" },
--        }, { prefix = "<leader>" })
--    end
--}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

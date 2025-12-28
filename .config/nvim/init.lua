-- ============================================================================
-- PLUGIN MANAGER SETUP
-- ============================================================================
-- Bootstrap and load lazy.nvim plugin manager
require("config.lazy")

-- ============================================================================
-- INITIAL CONFIGURATION
-- ============================================================================
-- Disable netrw (Neovim's built-in file explorer) since we use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader key to Space for custom keybindings
vim.g.mapleader = " "

-- Load colorscheme (Catppuccin Mocha variant)
vim.cmd.colorscheme "catppuccin-mocha"

-- ============================================================================
-- KEYMAPS - MOVEMENT & EDITING
-- ============================================================================

-- Move selected lines up/down in visual mode and maintain selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- Move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- Move line up

-- Join lines while keeping cursor in place (instead of moving to end)
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page scrolling with cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Scroll down
vim.keymap.set("n", "<C-u>", "<C-u>zz")  -- Scroll up

-- Search navigation with cursor centered
vim.keymap.set("n", "n", "nzzzv")  -- Next search result
vim.keymap.set("n", "N", "Nzzzv")  -- Previous search result

-- ============================================================================
-- KEYMAPS - CLIPBOARD OPERATIONS
-- ============================================================================

-- Paste over selection without overwriting clipboard (deletes to black-hole register "_)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard (+ register)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])  -- Yank selection
vim.keymap.set("n", "<leader>Y", [["+Y]])         -- Yank entire line

-- Delete to black-hole register (doesn't affect clipboard)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Reload current file (useful for sourcing config changes)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- ============================================================================
-- VIM-GO CONFIGURATION
-- ============================================================================
-- Disable automatic type info display (we use LSP hover instead)
vim.g.go_auto_type_info = 0

-- Disable vim-go's K key handler (let LSP handle hover documentation)
vim.g.go_doc_keywordprg_enabled = 0

-- ============================================================================
-- EDITOR OPTIONS - UI
-- ============================================================================
-- Disable GUI cursor styling (use terminal cursor)
vim.opt.guicursor = ""

-- Show absolute line numbers
vim.opt.nu = true
-- Also show relative line numbers (useful for motions like 5j, 10k)
vim.opt.relativenumber = true

-- ============================================================================
-- EDITOR OPTIONS - INDENTATION
-- ============================================================================
-- Number of spaces a tab character represents
vim.opt.tabstop = 4
-- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4
-- Number of spaces to use for >> and << commands
vim.opt.shiftwidth = 4
-- Convert tabs to spaces
vim.opt.expandtab = true

-- Auto-indent new lines based on previous line
vim.opt.smartindent = true

-- ============================================================================
-- EDITOR OPTIONS - TEXT DISPLAY
-- ============================================================================
-- Don't wrap long lines
vim.opt.wrap = false

-- ============================================================================
-- EDITOR OPTIONS - FILE HANDLING
-- ============================================================================
-- Don't create swap files
vim.opt.swapfile = false
-- Don't create backup files
vim.opt.backup = false
-- Store undo history in a persistent file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- ============================================================================
-- EDITOR OPTIONS - SEARCH
-- ============================================================================
-- Don't highlight search results (cleaner interface)
vim.opt.hlsearch = false
-- Show matches as you type the search pattern
vim.opt.incsearch = true

-- ============================================================================
-- EDITOR OPTIONS - COLORS & APPEARANCE
-- ============================================================================
-- Enable 24-bit RGB colors in the terminal
vim.opt.termguicolors = true

-- ============================================================================
-- EDITOR OPTIONS - SCROLLING & COLUMNS
-- ============================================================================
-- Keep 8 lines visible above/below cursor when scrolling
vim.opt.scrolloff = 8
-- Always show the sign column (prevents text shifting when signs appear)
vim.opt.signcolumn = "yes"
-- Add @ and - as valid filename characters
vim.opt.isfname:append("@-@")

-- ============================================================================
-- EDITOR OPTIONS - PERFORMANCE
-- ============================================================================
-- Faster CursorHold events (default is 4000ms)
vim.opt.updatetime = 50

-- ============================================================================
-- LSP CONFIGURATION
-- ============================================================================
-- Configure gopls (Go language server)
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
})
-- Enable gopls for Go files
vim.lsp.enable('gopls')

-- LSP Keymaps
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)      -- Go to definition
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)  -- Go to implementation
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)      -- Find references
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) -- Signature help (insert mode)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)            -- Hover documentation

-- Function to restart gopls LSP server
local function restart_gopls()
    local clients = vim.lsp.get_clients({ name = "gopls" })
    for _, client in ipairs(clients) do
        vim.lsp.stop_client(client.id)
    end
    -- Re-enable gopls after a short delay
    vim.defer_fn(function()
        vim.lsp.enable('gopls')
    end, 100)
end

-- Manual LSP restart keymap
vim.keymap.set("n", "<leader>lr", restart_gopls, opts)  -- Restart gopls

-- ============================================================================
-- AI ASSISTANT CONFIGURATION
-- ============================================================================
-- Disable GitHub Copilot (can be re-enabled with :Copilot enable)
vim.cmd("Copilot disable")

-- ============================================================================
-- DIAGNOSTICS CONFIGURATION
-- ============================================================================
-- Show diagnostic messages inline as virtual text
vim.diagnostic.config({
    virtual_text = true
})

-- Diagnostic navigation keymaps
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)  -- Next diagnostic
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)  -- Previous diagnostic

-- ============================================================================
-- UTILITY KEYMAPS
-- ============================================================================
-- Quick save with leader+w
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", opts)

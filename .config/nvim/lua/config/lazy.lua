-- ============================================================================
-- LAZY.NVIM BOOTSTRAP
-- ============================================================================
-- This file handles the installation and setup of lazy.nvim plugin manager

-- Determine where lazy.nvim should be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- If not installed, clone it from GitHub
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",  -- Partial clone for faster download
    "--branch=stable",     -- Use stable branch
    lazyrepo,
    lazypath
  })

  -- Handle installation errors
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy.nvim to Neovim's runtime path
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- LEADER KEY SETUP
-- ============================================================================
-- Set leader keys before loading plugins to ensure correct keymaps
vim.g.mapleader = " "       -- Space as leader key
vim.g.maplocalleader = "\\" -- Backslash as local leader

-- ============================================================================
-- LAZY.NVIM CONFIGURATION
-- ============================================================================
require("lazy").setup({
  spec = {
    -- Automatically import all plugin specs from lua/plugins/ directory
    -- Each .lua file in that directory defines a plugin configuration
    { import = "plugins" },
  },

  install = {
    -- Fallback colorscheme to use during plugin installation
    colorscheme = { "habamax" }
  },

  checker = {
    -- Automatically check for plugin updates on startup
    enabled = true
  },
})

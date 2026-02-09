-- ===============================
-- Core Options
-- ===============================
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- 1. Tell Neovim to use the system clipboard for everything
vim.opt.clipboard = 'unnamedplus'

-- 2. Manually define the "WslClipboard" provider
-- This uses clip.exe for copying and PowerShell for pasting
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
     ["+"] = 'clip.exe',
     ["*"] = 'clip.exe',
   },
  paste = {
     ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
     ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- Leader key (BEFORE keymaps)
vim.g.mapleader = " "

-- ===============================
-- lazy.nvim bootstrap
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ===============================
-- Load Plugins
-- ===============================
require("lazy").setup(require("plugins"))

-- ===============================
-- Keymaps
-- ===============================
require("keymaps")

-- ===============================
-- Colorscheme (AFTER plugins load)
-- ===============================
vim.cmd.colorscheme("PaperColor")

-- ===============================
-- IndentBlankline (v2) highlights
-- ===============================
vim.cmd([[highlight IndentBlanklineChar guifg=#3b4048]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#7f848e]])

-- ===============================
-- IndentBlankline lazy highlights
-- ===============================
vim.api.nvim_create_autocmd("User", {
  pattern = "IndentBlanklineReady",
  callback = function()
    vim.cmd([[highlight IndentBlanklineChar guifg=#3b4048]])
    vim.cmd([[highlight IndentBlanklineContextChar guifg=#7f848e]])
  end,
})

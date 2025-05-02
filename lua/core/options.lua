-- Set leader key (IMPORTANT: Set this very early, before keymaps/plugins)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true -- Keep global variables here or in init.lua

-- WSL things
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

local opt = vim.opt -- Alias for vim.opt

-- [[ Setting options ]]
-- Enable true color support
opt.termguicolors = true
-- Make line numbers default
opt.number = true
opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
opt.showmode = false
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
opt.breakindent = true
-- Save undo history
opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true
-- Keep signcolumn on by default
opt.signcolumn = 'yes'
-- Decrease update time
opt.updatetime = 250
-- Decrease mapped sequence wait time
opt.timeoutlen = 300
-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
opt.inccommand = 'split'
-- Show which line your cursor is on
opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

return {} -- Modules should return something, even if empty for this case

-- Set <Space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sync clipboard between macOS and NeoVim
vim.opt.clipboard = 'unnamedplus'

-- Enable 24-bit color (Vital for Ghostty/tmux setup)
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- Shows relative line number

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Search becomes case sensitive if you type an uppercase letter.
vim.opt.hlsearch = false -- Remove persistent highlight after searching

-- Faster update time for better responsiveness
vim.opt.updatetime = 250



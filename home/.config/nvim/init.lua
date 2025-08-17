-- Minimal Neovim configuration in Lua

-- Hide splash screen
vim.opt.shortmess:append("I")

-- Essential settings
vim.opt.number = true          -- Show line numbers
vim.opt.mouse = 'a'            -- Enable mouse
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.tabstop = 2            -- 2 spaces for tab
vim.opt.shiftwidth = 2         -- 2 spaces for indentation
vim.opt.ignorecase = true      -- Case insensitive search
vim.opt.smartcase = true       -- Unless capital letters are used
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Search as you type

-- Leader key
vim.g.mapleader = ","

-- Clipboard integration with macOS
vim.opt.clipboard = "unnamedplus"
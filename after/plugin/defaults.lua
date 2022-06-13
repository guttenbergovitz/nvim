local api = vim.api
local g = vim.g
local opt = vim.opt

-- leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- terminal colors on
opt.hlsearch = true -- highlight search
opt.number = true --make line numbers default
opt.relativenumber = true -- make relative number default
opt.mouse = "a" -- mouse on
opt.breakindent = true -- break indent on
opt.undofile = true --save undo history
opt.ignorecase = true -- search ignores casing
opt.smartcase = true -- smart case
opt.updatetime = 250 -- decrease update time
opt.signcolumn = "yes" -- always show sign column
opt.clipboard = "unnamedplus" -- access system clipboard

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

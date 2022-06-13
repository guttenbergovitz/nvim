--[[ DEFAULTS in VIMSCRIPT ]]--
-- TODO: migrate all vimscripts to Lua
vim.cmd([[
  set encoding=utf-8
  set vb " visual bell instead of ding dong
  set scrolloff=8 " scroll screen if closer to the egde
  set number
  set relativenumber
  set tabstop=2 softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
  set nowrap
  set termguicolors
  set mouse=a " mouse enabled
  set backspace=indent,eol,start " normal backspace behaviour

  set hidden  " TextEdit might fail if hidden is not set
  set nobackup " some servers have issues with backup files, see #649
  set nowritebackup
  set cmdheight=2 " give more space for displaying messages

  " having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " change the cursor from block to i-beam in INSERT mode
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[1 q"
]])

require('dependencies')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/statusline')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')

vim.cmd("colorscheme ayu-light")

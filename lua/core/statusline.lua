----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: feline.nvim
-- url: https://github.com/feline-nvim/feline.nvim

-- For the configuration see the Usage section:
-- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md

-- Thanks to ibhagwan for the example to follow:
-- https://github.com/ibhagwan/nvim-lua

local status_ok, feline = pcall(require, 'feline')
if not status_ok then
  return
end

-- Providers (LSP, vi_mode)
local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

-- LSP diagnostic
local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

local separator = '|'

-- My components
local comps = {
  -- vi_mode -> NORMAL, INSERT..
  vi_mode = {
    left = {
      provider = function()
        local label = ' '..vi_mode_utils.get_vim_mode()..' '
        return label
      end,
      left_sep = ' ',
      right_sep = ' ',
    }
  },
  -- Parse file information:
  file = {
    -- File name
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = '',
        }
      },
      icon = '',
    },
    -- File type
    type = {
      provider = function()
        local type = vim.bo.filetype:lower()
        local extension = vim.fn.expand '%:e'
        local icon = require('nvim-web-devicons').get_icon(extension)
        if icon == nil then
          icon = ' '
        end
        return ' ' .. icon .. ' ' .. type
      end,
      left_sep = {
        str = ' ' .. separator,
      },
      righ_sep = ' ',
    },
    -- Operating system
    os = {
      provider = function()
        local os = vim.bo.fileformat:lower()
        local icon
        if os == 'unix' then
          icon = '  '
        elseif os == 'mac' then
          icon = '  '
        else
          icon = '  '
        end
        return icon .. os
      end,
      left_sep = {
        str = ' ' .. separator,
      },
      right_sep = {
        str = ' ' .. separator,
      },
    },
    -- Line-column
    position = {
      provider = { name = 'position' },
      hl = {
        style = 'bold',
      },
      left_sep = ' ',
      right_sep = ' ',
    },
    -- Cursor position in %
    line_percentage = {
      provider = { name = 'line_percentage' },
      hl = {
        style = 'bold',
      },
      left_sep = ' ',
      right_sep = ' ',
    },
    -- Simple scrollbar
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      left_sep = ' ',
      right_sep = ' ',
    },
  },
  -- LSP info
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      icon = ' ',
      left_sep = '  ',
    },
    warn = {
      provider = 'diagnostic_warnings',
      icon = ' ' ,
      left_sep = ' ',
    },
    info = {
      provider = 'diagnostic_info',
      icon = ' ',
      left_sep = ' ',
    },
    hint = {
      provider = 'diagnostic_hints',
      icon = ' ',
      left_sep = ' ',
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      icon = '  ',
      left_sep = '  ',
      right_sep = ' ',
    }
  },
  -- git info
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      left_sep = '  ',
    },
    add = {
      provider = 'git_diff_added',
      icon = '  ',
      left_sep = ' ',
    },
    change = {
      provider = 'git_diff_changed',
      icon = '  ',
      left_sep = ' ',
    },
    remove = {
      provider = 'git_diff_removed',
      icon = '  ',
      left_sep = ' ',
    }
  }
}

-- Get active/inactive components
-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#components
local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Left Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.type)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.position)
table.insert(components.active[2], comps.file.line_percentage)

-- Call feline
feline.setup {
  components = components,
  force_inactive = {
    filetypes = {
      '^NvimTree$',
      '^packer$',
      '^vista$',
      '^help$',
    },
    buftypes = {
      '^terminal$'
    },
    bufnames = {},
  },
}

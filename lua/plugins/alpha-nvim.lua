-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16


local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()

  -- fortune
  local fortune = require "alpha.fortune"
  local quote = table.concat(fortune(), "\n")

  return '--------------------------------------------------' .. '\n' .. quote
end

-- Banner
local banner = {
	[[                        _=_                         ]],
	[[                      q(-_-)p                       ]],
	[[                      '_) (_`                       ]],
	[[                      /__/  \	                      ]],
	[[                    _(<_   / )_                     ]],
	[[                   (__\_\_|_/__)                    ]],
  [[                -------------------                 ]],
  [[                                                    ]],
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('f', '  Telescope File', ':Telescope find_files<CR>'),
  dashboard.button('r', '  Ranger', ':Ranger<CR>'),
  dashboard.button('n', '  New File', ':ene <BAR> startinsert<CR>'),
  dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update Plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)

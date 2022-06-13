-- auto install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- refresh plugins after changes in packer_init.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- protected call === we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- plugins install
return packer.startup(function(use)
  --
  use 'wbthomason/packer.nvim' -- packer can manage itself

  --[[ EXPLORATION ]]--

  -- nvim tree
  use 'kyazdani42/nvim-tree.lua'

  -- ranger / file browser
  use { "rbgrouleff/bclose.vim" }
  use { "francoiscabrol/ranger.vim" }

  use {
		"nvim-telescope/telescope.nvim",
		opt = true,
		config = function()
		  require("plugins.telescope").setup()
		end,
		cmd = { "Telescope" },
		module = "telescope",
		keys = { "<leader>f", "<leader>p" },
		wants = {
			"plenary.nvim",
			"popup.nvim",
			-- "telescope-fzf-native.nvim",
			"telescope-project.nvim",
			"telescope-repo.nvim",
			"telescope-file-browser.nvim",
			"project.nvim",
		},
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			-- { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"nvim-telescope/telescope-project.nvim",
			"cljoly/telescope-repo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup {}
				end,
			},
		},
	}

  --[[ NAVIGATION ]]--

  -- lightspeed motion
  use {
    "ggandor/lightspeed.nvim",
    config = function()
      require("lightspeed").setup {}
    end,
  }

  -- whichkey helper
  use {
		"folke/which-key.nvim",
		config = function()
			require("plugins.whichkey").setup()
		end,
	}




  --[[ CODE FORMATTING ]]--

  -- neoformat multiformatter
  use 'sbdchd/neoformat'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  --[[ LOOK & FEEL ]]--

  -- color schemes
  use 'Shatur/neovim-ayu'
  use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- smooth scrolling
  use 'psliwka/vim-smoothie'

  -- tag viewer
  use 'preservim/tagbar'


	-- shows info for current cursor position
  -- requires treesitter to understand the lingo
	use {
	  "SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		module = "nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	}

	use {
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		config = function()
			require("plugins.lualine").setup()
		end,
		requires = { "nvim-web-devicons" },
	}



  --[[ AUTOCOMPLETE & INTELLISENSE ]]--

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- completions
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  --[[ DEBUGGING ]]--

  use {
  "folke/lsp-trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    end
  }




  --[[ GIT ]]--

  -- fugitive
  use 'tpope/vim-fugitive'

  -- git labels / info
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

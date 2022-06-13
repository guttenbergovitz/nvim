local G = {}

function G.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- normal mode
    prefix = "<leader>",
    buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },


		x = {
			name = "Trouble",
      t = { "<cmd>Trouble toggle<CR>", "Browse" },
      o = { "<cmd>Trouble open<CR>", "Find" },
      c = { "<cmd>Trouble close<CR>", "Find" },
      r = { "<cmd>Trouble refresh<CR>", "Find" },
		},

		t = {
			name = "Telescope",
			t = {"<cmd>Telescope<CR>", "Telescope"},
			f = {"<cmd>Telescope find_files<CR>", "Telescope"},
			x = {"<cmd>Telescope file_browser<CR>", "Explorer"},
			b = {"<cmd>Telescope buffers<CR>", "Buffers"},
			q = {"<cmd>Telescope quickfix<CR>", "Quickfix"},
		},

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },


    g = {
      name = "Git",
      s = { "<cmd>Git<CR>", "Status" },
      d = { "<cmd>Gvdiffsplit<CR>", "Diff" },
      a = { "<cmd>Git add .<CR>", "Add all" },
      c = { "<cmd>Git commit<CR>", "Commit" },
      b = { "<cmd>Git blame<CR>", "Blame" },
      l = { "<cmd>Git log<CR>", "Log" },
			t = { "<cmd>Git log --graph --pretty=oneline --abbrev-commit<CR>", "Tree" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return G

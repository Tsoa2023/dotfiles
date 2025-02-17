return {
  {
    "Diogo-ss/42-header.nvim",
    cmd = { "Stdheader" },
    keys = { "<F1>" },
    opts = {
      default_map = true, -- Default mapping <F1> in normal mode.
      auto_update = true, -- Update header when saving.
      user = "fharifen", -- Your user.
      mail = "fharifen@student.42antananarivo.mg", -- Your mail.
      -- add other options.
    },
    config = function(_, opts)
      require("42header").setup(opts)
    end,
  },

  {
    "glepnir/galaxyline.nvim",
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('configs.galaxyline')
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          signature = { enabled = false },
          hover = { enabled = false },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
    highlight = { enble = false }, -- Désactive Treesitter
    },
  },
  {
	"mg979/vim-visual-multi",
	branch = "master",
	lazy = false,
	plugin = true,
	  config = function()
		vim.g.VM_leader = "\\" -- Définir un leader spécifique pour éviter les conflits
	  end,
  },
	{
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
	  'numToStr/Comment.nvim',
	  lazy = false,
	  config = function()
		require('Comment').setup()
	  end,
	},
	{
	  "mbbill/undotree",
	  lazy = true, -- Charge uniquement lorsqu'il est nécessaire
	  cmd = { "UndotreeToggle", "UndotreeShow" }, -- Commandes déclencheuses
	},

	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Charge les fonctionnalités de base
					["core.concealer"] = {}, -- Affichage amélioré
					["core.dirman"] = { -- Gestion des fichiers Neorg
						config = {
							workspaces = {
								notes = "~/neorg/neorg_notes", -- Change le chemin si besoin
								journal = "~/neorg/neorg_journal",
							},
							default_workspace = "notes",
						},
					},
				},
			}
		end,
	},
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      -- Remplace les commandes par défaut de NVIM
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
		{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "gr", mode = "n", function() require("flash").remote() end, desc = "Remote Flash" },  -- utilise "gr" au lieu de "r"
		{ "gR", mode = "n", function() require("flash").treesitter_search() end, desc = "Treesitter Search" }, -- utilise "gR" au lieu de "R"
		{ "<leader>s", mode = { "n", "x" }, function() require("flash").toggle() end, desc = "Toggle Flash" }, -- utilise <leader>s pour le mode toggle
    },
  },

}


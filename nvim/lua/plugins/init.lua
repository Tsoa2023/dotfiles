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
    event = 'BufWritePre', -- format on save
    opts = require "configs.conform",
  },

  -- Bufferline Cyberpunk Neon
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "BufReadPre",
    config = function()
      -- Couleurs Cyberpunk Neon Futuristic
      local neon_pink = "#ff2e97"
      local neon_cyan = "#00f0ff"
      local neon_purple = "#bd00ff"
      local neon_green = "#39ff14"
      local neon_yellow = "#ffff00"
      local neon_orange = "#ff6600"
      local neon_blue = "#00aaff"
      local dark_bg = "NONE"  -- Transparent!
      local pill_bg = "NONE" -- Fond des pilules
      local dim = "NONE"  -- Couleur atténuée pour le texte non sélectionné

      require("bufferline").setup({
        options = {
          mode = "buffers",
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = "",
            style = "icon",
          },
          buffer_close_icon = "󰅙",
          modified_icon = "●",
          close_icon = "󰅙",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "" or ""
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "  EXPLORER ",
              text_align = "center",
              separator = true,
              highlight = "Directory",
            },
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true,
          separator_style = "thick", -- Style arrondi/slant!
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
        },
        highlights = {
          -- Fond transparent
          fill = {
            fg = dim,
            bg = dark_bg,
          },
          -- Buffers non sélectionnés
          background = {
            fg = dim,
            bg = pill_bg,
          },
          buffer_visible = {
            fg = neon_purple,
            bg = pill_bg,
          },
          -- Buffer sélectionné - Style pilule neon
          buffer_selected = {
            fg = neon_cyan,
            bg = pill_bg,
            bold = true,
            italic = false,
          },
          -- Boutons fermer
          close_button = {
            fg = dim,
            bg = pill_bg,
          },
          close_button_visible = {
            fg = neon_purple,
            bg = pill_bg,
          },
          close_button_selected = {
            fg = neon_pink,
            bg = pill_bg,
          },
          -- Indicateur modifié
          modified = {
            fg = neon_orange,
            bg = pill_bg,
          },
          modified_visible = {
            fg = neon_orange,
            bg = pill_bg,
          },
          modified_selected = {
            fg = neon_green,
            bg = pill_bg,
          },
          -- Séparateurs slant - IMPORTANT pour le style arrondi
          separator = {
            fg = pill_bg,
            bg = dark_bg,
          },
          separator_visible = {
            fg = pill_bg,
            bg = dark_bg,
          },
          separator_selected = {
            fg = pill_bg,
            bg = dark_bg,
          },
          -- Indicateur
          indicator_selected = {
            fg = neon_cyan,
            bg = pill_bg,
          },
          indicator_visible = {
            fg = neon_purple,
            bg = pill_bg,
          },
          -- Tabs
          tab = {
            fg = dim,
            bg = pill_bg,
          },
          tab_selected = {
            fg = "#0d0d0d",
            bg = neon_cyan,
            bold = true,
          },
          tab_separator = {
            fg = pill_bg,
            bg = dark_bg,
          },
          tab_separator_selected = {
            fg = neon_cyan,
            bg = dark_bg,
          },
          tab_close = {
            fg = neon_pink,
            bg = pill_bg,
          },
          -- Duplicates
          duplicate = {
            fg = dim,
            bg = pill_bg,
            italic = true,
          },
          duplicate_visible = {
            fg = neon_purple,
            bg = pill_bg,
            italic = true,
          },
          duplicate_selected = {
            fg = neon_cyan,
            bg = pill_bg,
            italic = true,
          },
          -- Diagnostics
          diagnostic = {
            fg = dim,
            bg = pill_bg,
          },
          diagnostic_visible = {
            fg = neon_purple,
            bg = pill_bg,
          },
          diagnostic_selected = {
            fg = neon_cyan,
            bg = pill_bg,
            bold = true,
          },
          -- Errors
          error = {
            fg = neon_pink,
            bg = pill_bg,
          },
          error_visible = {
            fg = neon_pink,
            bg = pill_bg,
          },
          error_selected = {
            fg = neon_pink,
            bg = pill_bg,
            bold = true,
          },
          error_diagnostic = {
            fg = neon_pink,
            bg = pill_bg,
          },
          error_diagnostic_visible = {
            fg = neon_pink,
            bg = pill_bg,
          },
          error_diagnostic_selected = {
            fg = neon_pink,
            bg = pill_bg,
            bold = true,
          },
          -- Warnings
          warning = {
            fg = neon_yellow,
            bg = pill_bg,
          },
          warning_visible = {
            fg = neon_yellow,
            bg = pill_bg,
          },
          warning_selected = {
            fg = neon_yellow,
            bg = pill_bg,
            bold = true,
          },
          warning_diagnostic = {
            fg = neon_yellow,
            bg = pill_bg,
          },
          warning_diagnostic_visible = {
            fg = neon_yellow,
            bg = pill_bg,
          },
          warning_diagnostic_selected = {
            fg = neon_yellow,
            bg = pill_bg,
            bold = true,
          },
          -- Numbers
          numbers = {
            fg = neon_purple,
            bg = pill_bg,
          },
          numbers_visible = {
            fg = neon_purple,
            bg = pill_bg,
          },
          numbers_selected = {
            fg = neon_cyan,
            bg = pill_bg,
            bold = true,
          },
          -- Offset separator (NvimTree)
          offset_separator = {
            fg = neon_cyan,
            bg = dark_bg,
          },
          -- Trunc markers
          trunc_marker = {
            fg = neon_pink,
            bg = dark_bg,
          },
        },
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason pour installer facilement les LSP servers
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier",
        "stylua",
      },
    },
  },

  -- Connecter Mason avec lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "tailwindcss",
          "prismals",
          "emmet_ls",
          "eslint",
          "jsonls",
          "html",
          "cssls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- Autocomplétion améliorée avec nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Sources de complétion
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp || true", -- Ignorer l'erreur si le build échoue
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      -- React/TypeScript snippets
      "dsznajder/vscode-es7-javascript-react-snippets",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      -- Charger les snippets VS Code (friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }

      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      return opts
    end,
  },

  -- Auto-pairs et auto-tags pour React/HTML
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        typescript = { "template_string" },
        javascriptreact = { "template_string" },
        typescriptreact = { "template_string" },
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },

  -- Treesitter amélioré pour le highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc",
        -- Web
        "html", "css", "scss",
        "javascript", "typescript", "tsx",
        "json", "jsonc", "yaml",
        "prisma",
        "markdown", "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    },
  },



  -- TailwindCSS colors in completion
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },

  -- Highlight des couleurs TailwindCSS dans le code
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
        css = true,
        css_fn = true,
      },
    },
  },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },


	{
	  "rcarriga/nvim-notify",
	  config = function()
		require("notify").setup({
		  timeout = 100,               -- plus rapide (en ms)
		  top_down = false,           -- bas de l'écran
		  render = "default",         -- ou "minimal" pour un style épuré
		})
		vim.notify = require("notify")
	  end,
	},
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
		version = "v7.0.0", -- Version stable sans luarocks
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
	{
		'junegunn/vim-easy-align',
		event = "VeryLazy",
		-- Optional: You can add 'lazy = true' if you want to explicitly lazy-load it,
		-- though lazy.nvim often handles this automatically based on usage.
		-- lazy = true,
	},
}

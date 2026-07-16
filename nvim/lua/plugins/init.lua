return {
  {
    "Diogo-ss/42-header.nvim",
    cmd = { "Stdheader" },
    keys = { "<F1>" },
    opts = {
      default_map = true,                          -- Default mapping <F1> in normal mode.
      auto_update = true,                          -- Update header when saving.
      user = "fharifen",                           -- Your user.
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
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('configs.galaxyline')
    end,
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- format on save
    opts = require "configs.conform",
  },

  -- ╔═══════════════════════════════════════════════════════════════╗
  -- ║         GITHUB COPILOT - AI Code Completion                 ║
  -- ╚═══════════════════════════════════════════════════════════════╝
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Keymaps personnalisés pour Copilot
      vim.g.copilot_no_tab_map = true -- Désactiver Tab par défaut pour éviter conflit
      vim.keymap.set("i", "<M-l>", 'copilot#Accept("<CR>")',
        { expr = true, replace_keycodes = false, desc = "Copilot Accept" })
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot Next" })
      vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Copilot Previous" })
      vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", { desc = "Copilot Dismiss" })
    end,
  },

  -- ╔═══════════════════════════════════════════════════════════════╗
  -- ║           BARBAR.NVIM - CYBERPUNK NEON TABLINE               ║
  -- ║         Better UI with proper rounded separators             ║
  -- ╚═══════════════════════════════════════════════════════════════╝
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    event = "BufReadPre",
    config = function()
      -- Couleurs Cyberpunk Neon Futuristic
      local neon_pink = "#ff2e97"
      local neon_cyan = "#00f0ff"
      local neon_purple = "#bd00ff"
      local neon_green = "#39ff14"
      local neon_yellow = "#ffff00"
      local neon_orange = "#ff6600"
      local dark_bg = "#0d0d1a"
      local pill_bg = "#1a1a2e"
      local dim = "#4a4a6a"

      require("barbar").setup({
        animation = true,
        auto_hide = false,
        tabpages = true,
        clickable = true,
        focus_on_close = "left",

        icons = {
          buffer_index = false,
          buffer_number = false,
          button = "󰅙",

          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.HINT] = { enabled = true, icon = "󰌵 " },
          },

          gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
          },

          modified = { button = "●" },
          pinned = { button = "󰐃", filename = true },

          -- Séparateurs Powerline arrondis (Nerd Font Powerline Extra)
          separator = { left = "", right = "" },
          separator_at_end = true,

          inactive = { separator = { left = "", right = "" } },
          current = { buffer_index = false },
          visible = { modified = { buffer_number = false } },

          filetype = {
            custom_colors = false,
            enabled = true,
          },
        },

        insert_at_end = false,
        insert_at_start = false,
        maximum_padding = 2,
        minimum_padding = 1,
        maximum_length = 30,
        minimum_length = 0,
        semantic_letters = true,
        sidebar_filetypes = {
          NvimTree = { text = " 󰙅 EXPLORER", align = "center" },
          undotree = { text = "UNDOTREE" },
        },
        letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
        no_name_title = "[No Name]",
      })

      -- ╔═══════════════════════════════════════════════════════════════╗
      -- ║              HIGHLIGHTS CYBERPUNK NEON                       ║
      -- ╚═══════════════════════════════════════════════════════════════╝

      -- Buffer actif - Style Cyberpunk avec coins arrondis
      vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#0d0d0d", bg = neon_cyan, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = "#0d0d0d", bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = neon_green, bg = neon_cyan, bold = true })
      -- Sign groups used for left/right separators: fg should be previous bg, bg current bg
      vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = neon_cyan, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferCurrentSignRight", { fg = neon_cyan, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferCurrentTarget", { fg = neon_pink, bg = neon_cyan, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentIcon", { fg = "#0d0d0d", bg = neon_cyan })
      -- Ensure filename/logo uses cyan background and readable foreground when active
      vim.api.nvim_set_hl(0, "BufferCurrentFilename", { fg = "#0d0d0d", bg = neon_cyan, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentName", { fg = "#0d0d0d", bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentBuffer", { fg = "#0d0d0d", bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentERROR", { fg = neon_pink, bg = neon_cyan, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentWARN", { fg = neon_yellow, bg = neon_cyan, bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentINFO", { fg = neon_purple, bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentHINT", { fg = neon_green, bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentADDED", { fg = neon_green, bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentCHANGED", { fg = neon_orange, bg = neon_cyan })
      vim.api.nvim_set_hl(0, "BufferCurrentDELETED", { fg = neon_pink, bg = neon_cyan })

      -- Buffer visible (dans une autre fenêtre)
      vim.api.nvim_set_hl(0, "BufferVisible", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferVisibleSignRight", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferVisibleTarget", { fg = neon_pink, bg = pill_bg, bold = true })
      vim.api.nvim_set_hl(0, "BufferVisibleIcon", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleERROR", { fg = neon_pink, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleWARN", { fg = neon_yellow, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleINFO", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleHINT", { fg = neon_green, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleADDED", { fg = neon_green, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleCHANGED", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferVisibleDELETED", { fg = neon_pink, bg = pill_bg })

      -- Buffer inactif
      vim.api.nvim_set_hl(0, "BufferInactive", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferInactiveSignRight", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferInactiveTarget", { fg = neon_pink, bg = pill_bg, bold = true })
      vim.api.nvim_set_hl(0, "BufferInactiveIcon", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveERROR", { fg = neon_pink, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveWARN", { fg = neon_yellow, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveINFO", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveHINT", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveADDED", { fg = neon_green, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveCHANGED", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferInactiveDELETED", { fg = neon_pink, bg = pill_bg })

      -- Fond de la tabline (transparent)
      vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = dim, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferTabpages", { fg = neon_cyan, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "BufferTabpagesSep", { fg = neon_cyan, bg = "NONE" })

      -- Offset (NvimTree)
      vim.api.nvim_set_hl(0, "BufferOffset", { fg = neon_cyan, bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "BufferOffsetSeparator", { fg = neon_cyan, bg = "NONE" })

      -- ScrollArrow
      vim.api.nvim_set_hl(0, "BufferScrollArrow", { fg = neon_pink, bg = "NONE" })

      -- Alternate buffer
      vim.api.nvim_set_hl(0, "BufferAlternate", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateSign", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferAlternateSignRight", { fg = pill_bg, bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferAlternateMod", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateTarget", { fg = neon_pink, bg = pill_bg, bold = true })
      vim.api.nvim_set_hl(0, "BufferAlternateIcon", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateIndex", { fg = neon_purple, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateERROR", { fg = neon_pink, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateWARN", { fg = neon_yellow, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateINFO", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateHINT", { fg = dim, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateADDED", { fg = neon_green, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateCHANGED", { fg = neon_orange, bg = pill_bg })
      vim.api.nvim_set_hl(0, "BufferAlternateDELETED", { fg = neon_pink, bg = pill_bg })

      -- Autocmd pour re-appliquer après changement de colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#0d0d0d", bg = neon_cyan, bold = true })
          vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = neon_cyan, bg = pill_bg })
          vim.api.nvim_set_hl(0, "BufferCurrentSignRight", { fg = neon_cyan, bg = pill_bg })
          vim.api.nvim_set_hl(0, "BufferCurrentIcon", { fg = "#0d0d0d", bg = neon_cyan })
          vim.api.nvim_set_hl(0, "BufferCurrentFilename", { fg = "#0d0d0d", bg = neon_cyan, bold = true })
          vim.api.nvim_set_hl(0, "BufferCurrentName", { fg = "#0d0d0d", bg = neon_cyan })
          vim.api.nvim_set_hl(0, "BufferCurrentBuffer", { fg = "#0d0d0d", bg = neon_cyan })
          vim.api.nvim_set_hl(0, "BufferInactive", { fg = dim, bg = pill_bg })
          vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = pill_bg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferInactiveSignRight", { fg = pill_bg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = dim, bg = "NONE" })
        end,
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
    -- La config est maintenant chargée par mason-lspconfig
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
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
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

      -- Charger la configuration lspconfig après mason-lspconfig
      require("configs.lspconfig")
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
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
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
        timeout = 100,      -- plus rapide (en ms)
        top_down = false,   -- bas de l'écran
        render = "default", -- ou "minimal" pour un style épuré
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
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
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
    lazy = true,                                -- Charge uniquement lorsqu'il est nécessaire
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
          ["core.defaults"] = {},  -- Charge les fonctionnalités de base
          ["core.concealer"] = {}, -- Affichage amélioré
          ["core.dirman"] = {      -- Gestion des fichiers Neorg
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
      { "s",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash Jump" },
      { "S",         mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "gr",        mode = "n",               function() require("flash").remote() end,            desc = "Remote Flash" },      -- utilise "gr" au lieu de "r"
      { "gR",        mode = "n",               function() require("flash").treesitter_search() end, desc = "Treesitter Search" }, -- utilise "gR" au lieu de "R"
      { "<leader>s", mode = { "n", "x" },      function() require("flash").toggle() end,            desc = "Toggle Flash" },      -- utilise <leader>s pour le mode toggle
    },
  },
  {
    'junegunn/vim-easy-align',
    event = "VeryLazy",
    -- Optional: You can add 'lazy = true' if you want to explicitly lazy-load it,
    -- though lazy.nvim often handles this automatically based on usage.
    -- lazy = true,
  },
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    opts = {
      -- Options facultatives
      opts = {
        buflisted = false,
        number = false,
        relativenumber = false,
        signcolumn = "auto",
        winfixheight = true,
        wrap = false,
      },
      -- Mappages de touches à l'intérieur de la quickfix
      keys = {
        { ">", function() require("quicker").expand() end,   desc = "Expand context" },
        { "<", function() require("quicker").collapse() end, desc = "Collapse context" },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- Déclencheurs de chargement (Triggers)
    ft = { 'markdown', 'quarto' },
    cmd = { 'RenderMarkdown' },

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons' -- Assurez-vous d'avoir des icônes fonctionnelles
    },

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      -- Vos options personnalisées iront ici plus tard
    },
  },
  {
    "allaman/emoji.nvim",
    version = "*",
    opts = {
      enable_cmp_integration = true,
    },
  }
}

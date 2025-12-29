-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "monekai", -- default theme
    integrations = {},
    transparency = true,
    hl_override = {
      -- Cyberpunk Neon Dashboard
      NvDashAscii = { fg = "#00f0ff", bold = true },
      NvDashButtons = { fg = "#ff2e97" },

      -- Statusline Cyberpunk Neon Futuristic
      StatusLine = { bg = "NONE" },
      St_file = { fg = "#00f0ff", bg = "#1a1a2e", bold = true },
      St_file_sep = { fg = "#1a1a2e", bg = "NONE" },
      St_gitIcons = { fg = "#ff2e97", bg = "#1a1a2e" },
      St_Lsp = { fg = "#39ff14", bg = "#1a1a2e" },
      St_LspMsg = { fg = "#bd00ff", bg = "#1a1a2e" },
      St_EmptySpace = { fg = "#1a1a2e", bg = "NONE" },
      St_EmptySpace2 = { fg = "#1a1a2e", bg = "NONE" },
      St_pos_sep = { fg = "#1a1a2e", bg = "NONE" },
      St_pos_icon = { fg = "#0d0d0d", bg = "#00f0ff", bold = true },
      St_pos_text = { fg = "#00f0ff", bg = "#1a1a2e", bold = true },
      St_cwd = { fg = "#bd00ff", bg = "#1a1a2e", bold = true },
      St_cwd_sep = { fg = "#1a1a2e", bg = "NONE" },
      St_cwd_icon = { fg = "#0d0d0d", bg = "#bd00ff" },

      -- Couleurs Neon Futuristic pour les modes
      St_NormalMode = { fg = "#0d0d0d", bg = "#00f0ff", bold = true },
      St_InsertMode = { fg = "#0d0d0d", bg = "#39ff14", bold = true },
      St_VisualMode = { fg = "#0d0d0d", bg = "#ff2e97", bold = true },
      St_ReplaceMode = { fg = "#0d0d0d", bg = "#ff6600", bold = true },
      St_TerminalMode = { fg = "#0d0d0d", bg = "#bd00ff", bold = true },
      St_CommandMode = { fg = "#0d0d0d", bg = "#ffff00", bold = true },
      St_ConfirmMode = { fg = "#0d0d0d", bg = "#00aaff", bold = true },
      St_SelectMode = { fg = "#0d0d0d", bg = "#ff00ff", bold = true },
      St_NterminalMode = { fg = "#0d0d0d", bg = "#bd00ff", bold = true },
      St_NormalModeSep = { fg = "#00f0ff", bg = "#1a1a2e" },
      St_InsertModeSep = { fg = "#39ff14", bg = "#1a1a2e" },
      St_VisualModeSep = { fg = "#ff2e97", bg = "#1a1a2e" },
      St_ReplaceModeSep = { fg = "#ff6600", bg = "#1a1a2e" },
      St_TerminalModeSep = { fg = "#bd00ff", bg = "#1a1a2e" },
      St_CommandModeSep = { fg = "#ffff00", bg = "#1a1a2e" },
      St_ConfirmModeSep = { fg = "#00aaff", bg = "#1a1a2e" },
      St_SelectModeSep = { fg = "#ff00ff", bg = "#1a1a2e" },
      St_NterminalModeSep = { fg = "#bd00ff", bg = "#1a1a2e" },

      -- Bufferline/TabLine transparency
      TabLine = { bg = "NONE" },
      TabLineFill = { bg = "NONE" },
      TabLineSel = { bg = "NONE" },
    },
    hl_add = {
      NvDashLazy = { fg = "#bd00ff" },
    },
    theme_toggle = { "monekai", "one_light" },
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      lspkind_text = true,
      style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "bordered" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "minimal", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "round",
      order = nil,
      modules = nil,
    },

    -- Désactiver la tabufline NvChad pour utiliser bufferline.nvim
    tabufline = {
      enabled = false,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {

'███████╗███╗   ███╗ █████╗ ██╗     ██╗     ',
'██╔════╝████╗ ████║██╔══██╗██║     ██║     ',
'███████╗██╔████╔██║███████║██║     ██║     ',
'╚════██║██║╚██╔╝██║██╔══██║██║     ██║     ',
'███████║██║ ╚═╝ ██║██║  ██║███████╗███████╗',
'╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝',

--[[      ' ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ',
      ' ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ',
      ' ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ',
      ' ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ',
      ' ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ',
      ' ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ',
      ' ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ',
      ' ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ',
      ' ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ',
      ' ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
      ' ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ',
      ' ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ',
      ' ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ',
      ' ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ',
      '      Powered By  eovim       ',
      '                                ',
			]]},

    buttons = {
      { txt = "........................................"},

      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashLazy",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.25,
      col = 0.25,
      width = 0.5,
      height = 0.5,
      border = "rounded",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

return M


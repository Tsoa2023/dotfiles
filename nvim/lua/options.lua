require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- Numéros de ligne
o.number = true
o.relativenumber = true
o.numberwidth = 4

-- Ligne courante mise en évidence
o.cursorline = true

-- Colonne de signe pour les diagnostics
o.signcolumn = "yes"

-- Configuration des diagnostics LSP
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- ou "■", "▎", ""
    spacing = 4,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
})

-- Raccourcis pour naviguer entre les erreurs
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic précédent" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic suivant" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Afficher l'erreur" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Liste des diagnostics" })

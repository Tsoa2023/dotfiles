require "nvchad.mappings"

local map = vim.keymap.set

-- Custom mappings
map("n", ":", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save in normal, insert, and visual modes
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Add mappings for 'menu' plugin

-- Redimensionner les fenêtres
-- map('n', '<C-Left>', ':vertical resize +2<CR>')
-- map('n', '<C-Right>', ':vertical resize -2<CR>')
-- map('n', '<C-Up>', ':resize +2<CR>')
-- map('n', '<C-Down>', ':resize -2<CR>')
map("n", "<C-Left>", "<cmd>vertical resize -5<CR>", { desc = "Resize Window Left" })
map("n", "<C-Right>", "<cmd>vertical resize +5<CR>", { desc = "Resize Window Right" })
map("n", "+", "<cmd>horizontal resize +5<CR>", { desc = "Resize Window Up" })
map("n", "-", "<cmd>horizontal resize -5<CR>", { desc = "Resize Window Down" })

-- Keyboard users - opens the default menu with Ctrl-t
map("n", "<C-t>", function()
  require("menu").open("default")
end, { desc = "Open default menu" })

-- Mouse users + NvimTree users - opens contextual menu with right-click
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open contextual menu" })


-- Déplacer une ligne vers le bas
function MoveLineDown()
  local line = vim.fn.line('.')
  if line < vim.fn.line('$') then
    vim.cmd('move .+1')
    vim.cmd('normal! ==')
  end
end

-- Déplacer une ligne vers le haut
function MoveLineUp()
  local line = vim.fn.line('.')
  if line > 1 then
    vim.cmd('move .-2')
    vim.cmd('normal! ==')
  end
end

-- Mappages de touches
map('n', '<A-j>', ':lua MoveLineDown()<CR>', { noremap = true, silent = true })
map('n', '<A-k>', ':lua MoveLineUp()<CR>', { noremap = true, silent = true })


-- Fonction pour déplacer la sélection vers le bas
function MoveSelectionDown()
  local _, lnum_start, _, _ = unpack(vim.fn.getpos("'<"))
  local _, lnum_end, _, _ = unpack(vim.fn.getpos("'>"))

  if lnum_end < vim.fn.line('$') then
    vim.cmd("'<,'>move '>+1")
    vim.cmd("'<,'>normal! gv=gv")
  end
end

-- Fonction pour déplacer la sélection vers le haut
function MoveSelectionUp()
  local _, lnum_start, _, _ = unpack(vim.fn.getpos("'<"))
  local _, lnum_end, _, _ = unpack(vim.fn.getpos("'>"))

  if lnum_start > 1 then
    vim.cmd("'<,'>move '<-2")
    vim.cmd("'<,'>normal! gv=gv")
  end
end
  
map('v', '<A-j>', ':lua MoveSelectionDown()<CR>', { noremap = true, silent = true })
map('v', '<A-k>', ':lua MoveSelectionUp()<CR>', { noremap = true, silent = true })

map("n", "<C-a>j", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
map("n", "<C-n>", "<cmd>VMLive<CR>", { desc = "Visual Multi: VMLive" })

map("n", "<A-u>", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>q", ":bd<CR>", { silent = true, desc = "buffer delete" })

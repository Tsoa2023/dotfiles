require "nvchad.mappings"

local map = vim.keymap.set

-- Custom mappings
map("n", ":", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save in normal, insert, and visual modes
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Barbar navigation (remplace BufferLine)
map("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Buffer suivant" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Buffer précédent" })
map("n", "<leader>x", "<cmd>BufferClose<CR>", { desc = "Fermer le buffer" })
map("n", "<leader>bp", "<cmd>BufferPin<CR>", { desc = "Pin/Unpin buffer" })
map("n", "<leader>bP", "<cmd>BufferCloseAllButPinned<CR>", { desc = "Fermer les buffers non-pinnés" })
map("n", "<leader>bo", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Fermer les autres buffers" })
map("n", "<leader>bl", "<cmd>BufferCloseBuffersRight<CR>", { desc = "Fermer les buffers à droite" })
map("n", "<leader>bh", "<cmd>BufferCloseBuffersLeft<CR>", { desc = "Fermer les buffers à gauche" })
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>", { desc = "Aller au buffer 1" })
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>", { desc = "Aller au buffer 2" })
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>", { desc = "Aller au buffer 3" })
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>", { desc = "Aller au buffer 4" })
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>", { desc = "Aller au buffer 5" })
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>", { desc = "Aller au buffer 6" })
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>", { desc = "Aller au buffer 7" })
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>", { desc = "Aller au buffer 8" })
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>", { desc = "Aller au buffer 9" })
map("n", "<leader>0", "<cmd>BufferLast<CR>", { desc = "Aller au dernier buffer" })
map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", { desc = "Déplacer buffer à gauche" })
map("n", "<A->>", "<cmd>BufferMoveNext<CR>", { desc = "Déplacer buffer à droite" })
map("n", "<leader>bb", "<cmd>BufferPick<CR>", { desc = "Choisir un buffer" })

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

-- ╔═══════════════════════════════════════════════════════════════╗
-- ║              GITHUB COPILOT KEYMAPS                          ║
-- ╚═══════════════════════════════════════════════════════════════╝
map("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Toggle Copilot Panel" })
map("n", "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Enable Copilot" })
map("n", "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Disable Copilot" })

-- ╔═══════════════════════════════════════════════════════════════╗
-- ║              LSP KEYMAPS                                      ║
-- ╚═══════════════════════════════════════════════════════════════╝
-- Toggle inlay hints (suggestions de types)
map("n", "<leader>ti", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local current = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not current, { bufnr = bufnr })
end, { desc = "Toggle Inlay Hints" })

-- Suggestion navigation and acceptance (configured in copilot.lua)
-- <M-l> - Accept suggestion
-- <M-]> - Next suggestion
-- <M-[> - Previous suggestion
-- <C-]> - Dismiss suggestion

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

map("n", "<C-j>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
map("n", "<C-n>", "<cmd>VMLive<CR>", { desc = "Visual Multi: VMLive" })

map("n", "<A-u>", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>q", ":bufdo bd<CR>", { silent = true, desc = "buffer delete" })

map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle {
		pos = "float",
		id = "floatTerm",
		float_opts = {
			row = 0.35,
			col = 5.95,
			width = 0.65,
			height = 1.0,
		},
	}
end, { desc = "terminaltoggle floating term" })

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("", "<Space>", "<Nop>", opts)
keymap("x", "<C-c>", '"+y', opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- remove arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)

keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Down>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)

-- word corrections
vim.api.nvim_set_keymap("n", "<leader>xz", "[s1z=", {}) -- last misspeling
vim.api.nvim_set_keymap("n", "<leader>xc", "]s1z=", {}) -- next misspeling
vim.api.nvim_set_keymap("n", "<leader>xx", "1z=", {}) -- this word
vim.api.nvim_set_keymap('i', '@mail', '<C-r>=\'Ostap.Tymchenko@mail.citytech.cuny.edu\'<CR>', { noremap = true, silent = true })

keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>p', ':lua require("nabla").popup()<CR>', { noremap = true, silent = true })

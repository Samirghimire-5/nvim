local map = vim.keymap.set

-- jk to escape
map("i", "jk", "<Esc>", { silent = true })
map("v", "jk", "<Esc>", { silent = true })
map("t", "jk", [[<C-\><C-n>]], { silent = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

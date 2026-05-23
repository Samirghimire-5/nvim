local map = vim.keymap.set

-- jk to escape
map("i", "jk", "<Esc>", { silent = true, desc = "Exit insert mode" })
map("v", "jk", "<Esc>", { silent = true, desc = "Exit visual mode" })
map("t", "jk", [[<C-\><C-n>]], { silent = true, desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- npm install -g live-server  (install live-server globally in your machine)
-- Live Server
vim.keymap.set("n", "<leader>ls", function()
	vim.fn.jobstart({ "live-server", "." }, {
		detach = true,
	})
end, { desc = "Start Live Server" })

-- Stop Live Server
vim.keymap.set("n", "<leader>lq", function()
	vim.fn.jobstart({ "pkill", "live-server" }, {
		detach = true,
	})
end, { desc = "Stop Live Server" })

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
map("n", "<leader>se", "<cmd>wincmd =<CR>", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Move between splits
map("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Go to left split" })
map("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Go to lower split" })
map("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Go to upper split" })
map("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Go to right split" })

-- WezTerm note: <C-h> is often sent as <BS>
map("n", "<BS>", "<cmd>wincmd h<CR>", { desc = "Go to left split (Backspace)" })

-- Leader window navigation (always reliable)
map("n", "<leader>wh", "<cmd>wincmd h<CR>", { desc = "Win left" })
map("n", "<leader>wj", "<cmd>wincmd j<CR>", { desc = "Win down" })
map("n", "<leader>wk", "<cmd>wincmd k<CR>", { desc = "Win up" })
map("n", "<leader>wl", "<cmd>wincmd l<CR>", { desc = "Win right" })

-- Ctrl + Arrow navigation (terminal-friendly)
map("n", "<C-Left>", "<cmd>wincmd h<CR>", { desc = "Win left" })
map("n", "<C-Down>", "<cmd>wincmd j<CR>", { desc = "Win down" })
map("n", "<C-Up>", "<cmd>wincmd k<CR>", { desc = "Win up" })
map("n", "<C-Right>", "<cmd>wincmd l<CR>", { desc = "Win right" })

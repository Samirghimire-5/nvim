local map = vim.keymap.set

-- jk to escape
map("i", "jk", "<Esc>", { silent = true })
map("v", "jk", "<Esc>", { silent = true })
map("t", "jk", [[<C-\><C-n>]], { silent = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

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

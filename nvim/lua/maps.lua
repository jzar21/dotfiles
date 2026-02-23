vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down", silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Ident left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Ident right and reselect" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of the line" })

vim.keymap.set("n", "<C-m>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-n>", ":bprevious<CR>", { desc = "Previous buffer" })

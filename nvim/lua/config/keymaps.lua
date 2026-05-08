-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-A-j>", ":m .+1<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("i", "<C-A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line up", silent = true })
vim.keymap.set("v", "<C-A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<C-A-k>", ":m .-2<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("i", "<C-A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<C-A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down", silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Ident left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Ident right and reselect" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of the line" })

vim.keymap.set("n", "<C-m>", ":bnext<CR>zz", { desc = "Next buffer centering the cursor", silent = true })
vim.keymap.set("n", "<C-n>", ":bprevious<CR>zz", { desc = "Previous buffer centering the cursor", silent = true })

vim.keymap.set(
  "n",
  "<A-M>",
  "<cmd>cnext<CR>zz",
  { desc = "Next quick fix element centering the cursor", silent = true }
)
vim.keymap.set(
  "n",
  "<A-N>",
  "<cmd>cprev<CR>zz",
  { desc = "Prev quick fix element centering the cursor", silent = true }
)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jumps down centering the cursor", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jumps up centering the cursor", silent = true })

vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

local function pcol(above)
  local col = vim.fn.virtcol(".")
  local count = vim.v.count1
  if above then
    vim.cmd("normal! " .. count .. "P")
  else
    vim.cmd("normal! " .. count .. "p")
  end
  vim.fn.cursor(vim.fn.line("."), col)
end

vim.keymap.set("n", "p", function()
  pcol(false)
end, { desc = "Paste keeping same column" })
vim.keymap.set("n", "P", function()
  pcol(true)
end, { desc = "Paste above keeping same column" })

vim.keymap.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute word under cursor globally with prompt to edit flags" }
)

vim.keymap.set(
  "x",
  "<leader>p",
  [["_dP]],
  { desc = "Paste over selection without yanking it (preserve default register)" }
)

vim.keymap.set("n", "J", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local count = vim.v.count1
  vim.cmd("normal! " .. count .. "J")
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Join lines keeping cursor position", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered and unfolded", silent = true })

vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered and unfolded", silent = true })

vim.keymap.set("n", "<leader>tf", function()
  vim.g.autoformat = not vim.g.autoformat
  print("Autoformat: " .. (vim.g.autoformat and "ON" or "OFF"))
end, { desc = "Toggle autoformat on save" })

vim.keymap.set("n", "<leader>fw", function()
  vim.api.nvim_feedkeys("/", "n", false)
end, { desc = "Search in current file" })

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment selection" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer({
    hidden = true,
    ignored = true,
  })
end, { desc = "Explorer (cwd)" })

vim.keymap.set("n", "<leader>E", function()
  Snacks.explorer({
    hidden = true,
    ignored = true,
    cwd = LazyVim.root(),
  })
end, { desc = "Explorer (Root Dir)" })

vim.keymap.set(
  "n",
  "<leader><space>",
  LazyVim.pick("files", { root = false }),
  { remap = true, desc = "Find Files (cwd)" }
)

vim.keymap.set("n", "<leader>ff", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
vim.keymap.set("n", "<leader>fF", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

vim.keymap.set("n", "<leader>sG", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
vim.keymap.set("n", "<leader>sg", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })

vim.keymap.set({ "n", "x", "v" }, "<leader>sW", function()
  Snacks.picker.grep_word({ cwd = LazyVim.root(), word_match = "-w" })
end, { desc = "Word (Root Dir)" })

vim.keymap.set({ "n", "x", "v" }, "<leader>sw", function()
  Snacks.picker.grep_word({ word_match = "-w" })
end, { desc = "Word (cwd)" })

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  print("File added to harpoon")
  harpoon:list():add()
end, { desc = "Harpoon Add File" })

vim.keymap.set("n", "<leader>h", function()
  harpoon:list():select(1)
end, { desc = "Harpoon File 1" })

vim.keymap.set("n", "<leader>j", function()
  harpoon:list():select(2)
end, { desc = "Harpoon File 2" })

vim.keymap.set("n", "<leader>k", function()
  harpoon:list():select(3)
end, { desc = "Harpoon File 3" })

vim.keymap.set("n", "<leader>l", function()
  harpoon:list():select(4)
end, { desc = "Harpoon File 4" })

vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

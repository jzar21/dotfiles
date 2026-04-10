-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "80,120"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.o.list = true
vim.o.listchars = "tab:» ,trail:•,lead:•"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

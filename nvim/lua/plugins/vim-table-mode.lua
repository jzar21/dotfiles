return {
  "dhruvasagar/vim-table-mode",
  ft = { "markdown", "org", "quarto" },
  init = function()
    vim.g.table_mode_corner = "|"
  end,
}

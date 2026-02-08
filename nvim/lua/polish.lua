-- something overrides this config
local transparency_group = vim.api.nvim_create_augroup("NeoTreeTransparency", { clear = true })
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  group = transparency_group,
  callback = function()
    vim.schedule(function()
      local cmds = {
        "hi NeoTreeTabInactive guibg=NONE",
        "hi NeoTreeTabActive guibg=NONE",
        "hi NeoTreeTabSeparatorInactive guibg=NONE guifg=NONE",
        "hi NeoTreeTabSeparatorActive guibg=NONE guifg=NONE",
        "hi NeoTreeHeader guibg=NONE",
        "hi NeoTreeHeaderBar guibg=NONE",
        "hi NeoTreeNormal guibg=NONE",
        "hi NeoTreeNormalNC guibg=NONE",
        "hi NeoTreeToolbar guibg=NONE",
        "hi TabLineFill guibg=NONE",
      }

      for _, cmd in ipairs(cmds) do
        vim.cmd(cmd)
      end
    end)
  end,
})

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#404040" }) -- Color of the vline

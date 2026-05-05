return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local map = vim.keymap.set

    map("n", "<leader>a", function()
      print("File added to harpoon")
      harpoon:list():add()
    end, { desc = "Harpoon Add File" })

    map("n", "<leader>h", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon File 1" })
    map("n", "<leader>j", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon File 2" })
    map("n", "<leader>k", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon File 3" })
    map("n", "<leader>l", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon File 4" })

    map("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}

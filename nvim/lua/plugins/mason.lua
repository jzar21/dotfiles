return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = {
      -- install language servers
      "lua-language-server",
      "ruff",
      -- "ty",
      "pyright",
      "clangd",
      -- install formatters
      "stylua",
      -- install debuggers
      "debugpy",
      -- install any other package
      "tree-sitter-cli",
    }
  end,
}

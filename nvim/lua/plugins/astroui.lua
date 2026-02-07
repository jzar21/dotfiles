-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local color_bg = "NONE"

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
        Normal = { bg = color_bg },
        NormalNC = { bg = color_bg },
        SignColumn = { bg = color_bg },
        VertSplit = { bg = color_bg },
        StatusLine = { bg = color_bg },
        StatusLineNC = { bg = color_bg },
        LineNr = { bg = color_bg },
        CursorLineNr = { bg = color_bg },
        Pmenu = { bg = color_bg },
        PmenuSel = { bg = color_bg },
        NormalFloat = { bg = color_bg },
        FloatBorder = { bg = color_bg },
        BufferLine = { bg = color_bg },
        BufferLineFill = { bg = color_bg },
        BufferLineBackground = { bg = color_bg },
        BufferLineSeparator = { bg = color_bg },
        BufferLineIndicatorSelected = { bg = color_bg },
        BufferLineTabClose = { bg = color_bg },
        BufferLineTab = { bg = color_bg },
        BufferLineTabSelected = { bg = color_bg },
        HeirlineTabLine = { bg = color_bg },
        HeirlineBufferLine = { bg = color_bg },
        HeirlineStatusColumn = { bg = color_bg },
        TabLine = { bg = color_bg },
        TabLineFill = { bg = color_bg },
        TabLineSel = { bg = color_bg },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

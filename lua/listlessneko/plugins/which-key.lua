-- -- Useful plugin to show you pending keybinds.
--
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- event = "VimEnter",
  lazy = true,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- plugins = {
    --   marks = false,     -- shows a list of your marks on ' and `
    --   registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    --   spelling = {
    --     enabled = true,
    --     suggestions = 20,
    --   },
    --
    --   -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    --   -- No actual key bindings are created
    --   presets = {
    --     operators = false,    -- adds help for operators like d, y, ...
    --     motions = false,      -- adds help for motions
    --     text_objects = false, -- help for text objects triggered after entering an operator
    --     windows = false,      -- default bindings on <c-w>
    --     nav = false,          -- misc bindings to work with windows
    --     z = false,            -- bindings for folds, spelling and others prefixed with z
    --     g = false,            -- bindings for prefixed with g
    --   },
    -- },
    -- defer = {
    --   gc = "Comments" -- show the currently pressed key and its label as a message in the command line
    -- },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = require('listlessneko.config.icons').ui.BoldArrowRight, -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    win = {
      border = "single",        -- none, single, double, shadow
      title = false,
      -- position = "bottom",      -- bottom, top
      -- margin = { 2, 0, 2, 0 },  -- extra window margin [top, right, bottom, left]
      -- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      -- winblend = 0,
      -- zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    },
    -- layout = {
    --   height = { min = 4, max = 25 },                                             -- min and max height of the columns
    --   width = { min = 20, max = 50 },                                             -- min and max width of the columns
    --   spacing = 3,                                                                -- spacing between columns
    --   align = "left",                                                             -- align columns left, center or right
    -- },
    -- ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    -- show_help = true,                                                             -- show help message on the command line when the popup is visible
    -- show_keys = true,
    -- Disabled by default for Telescope
    -- disable = {
    --   buftypes = {},
    --   filetypes = { "TelescopePrompt" },
    -- },
  },
config = function(_, opts)
    local which_key = require("which-key")
    which_key.setup(opts)
    which_key.add(require('listlessneko.config.which-key.defaults'), {
      mode = "n",
      prefix = "<leader>",
    })
    which_key.add(require('listlessneko.config.which-key.non-leader'))
  end
}
-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {
--     icons = {
--       mappings = false
--     },
--
--     win = {
--       border = "single", -- none, single, double, shadow
--       title = false
--     },
--     spec = {
--       {
--         mode = { "n", "v" },
--         { "<leader>G", group = "Git" },
--         { "<leader>R", group = "Replace" },
--         { "<leader>l", group = "LSP" },
--         { "<leader>t", group = "Test" },
--         { "<leader>s", group = "Search" },
--         { "<leader>x", group = "diagnostics/quickfix" },
--         { "<leader>n", group = "Gen Annotations" },
--         { "<leader>N", group = "Package Info" },
--         { "<leader>g", group = "Go" },
--         { "<leader>W", group = "Workspace" },
--         { "[",         group = "prev" },
--         { "]",         group = "next" },
--         { "g",         group = "goto" },
--       },
--     },
--   },
--   keys = {
--     {
--       "<leader>?",
--       function()
--         require("which-key").show({ global = false })
--       end,
--       desc = "Buffer Local Keymaps (which-key)",
--     },
--   },
-- }

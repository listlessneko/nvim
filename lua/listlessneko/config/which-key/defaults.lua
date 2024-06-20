return {
  mode = { "n", "v" },
  [";"] = { ":Alpha<CR>", "Dashboard" },
  w = { ":w!<CR>", "Save" },
  q = { ":confirm q<CR>", "Quit" },
  f = { require("listlessneko.config.utils").telescope_git_or_file, "Find Files (Root)" },
  v = "Go to definition in a split",
  a = "Swap next param",
  A = "Swap previous param",
  o = { require("telescope.builtin").buffers, "Open Buffer" },
  W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
  b = {
    r = { "<cmd>Git status<CR>", "Git Status" },
  },

  u = {
    name = "UI",
    v = { require("listlessneko.config.utils").toggle_set_color_column, "Toggle Color Line" },
    c = { require("listlessneko.config.utils").toggle_cursor_line, "Toggle Cursor Line" },
  },
  i = {
    name = "Sessions",
    s = { "<cmd>lua require('persistence').load()<cr>", "Load Session" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Load Last Session" },
    d = { "<cmd>lua require('persistence').stop()<cr>", "Stop Persistence" },
  },
  -- r = {
  --   name = "Replace (Spectre)",
  --   r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  --   w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  --   f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
  -- },
  G = {
    name = "+Git",
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { require("telescope.builtin").git_status, "Open changed file" },
    b = { require("telescope.builtin").git_branches, "Checkout branch" },
    c = { require("telescope.builtin").git_commits, "Checkout commit" },
    C = {
      require("telescope.builtin").git_bcommits,
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
    U = { ":UndotreeToggle<CR>", "Toggle UndoTree" },
  },
  l = {
    name = "+LSP",
    a = { vim.lsp.buf.code_action, "Code Action" },
    A = { vim.lsp.buf.range_code_action, "Range Code Actions" },
    s = { vim.lsp.buf.signature_help, "Display Signature Information" },
    f = { vim.lsp.buf.format, "Format" },
    i = { require("telescope.builtin").lsp_implementations, "Implementation" },
    -- h = { vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()), "Inlay Hints" },
    w = { require("telescope.builtin").diagnostics, "Diagnostics" },
    -- t = { require("telescope").extensions.refactoring.refactors, "Refactor" },
    c = { require("listlessneko.config.utils").copyFilePathAndLineNumber, "Copy File Path and Line Number" },

    W = {
      name = "+Workspace",
      a = { vim.lsp.buf.add_workspace_folder, "Add Folder" },
      r = { vim.lsp.buf.remove_workspace_folder, "Remove Folder" },
      l = {
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        "List Folders",
      },
    },
  },
  s = {
    name = "+Search",
    f = { "<cmd>Telescope find_files<cr>", "Find File (CWD)" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    w = { "<cmd>Telescope grep_string<cr>", "Grep String" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    m = { "<cmd>Telescope git_status<cr>", "Git status" },
    S = { "<cmd>Telescope git_stash<cr>", "Git stash" },
    e = { "<cmd>Telescope frecency<cr>", "Frecency" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    N = {
      function ()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("listlessneko.config") })
      end,
      "Search Neovim Config",
    },
  },
}

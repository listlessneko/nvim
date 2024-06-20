-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  cmd = 'Neotree',
  keys = {
    { '<leader><tab>', ':Neotree toggle left<CR>', { desc = 'Neotree (left)' } },
    { '<leader>\\', ':Neotree toggle right<CR>', { desc = 'Neotree (right)' } },
    { '<leader>e', ':Neotree toggle float<CR>', { desc = 'Neotree float' } },
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      popup_border_style = 'single',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = 'NeoTreeModified',
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = 'float',
        width = 35,
      },
      filesystem = {
        use_libuv_file_watcher = true, -- used to watch for changes in files
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            'node_modules',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "   Files " },
          { source = "buffers", display_name = "   Bufs " },
          { source = "git_status", display_name = "   Git " },
        },
      },
      event_handlers = {
        {
          event = 'neo_tree_window_after_open',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd('wincmd =')
            end
          end,
        },
        {
          event = 'neo_tree_window_after_close',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd('wincmd =')
            end
          end,
        },
      },
    })
  end,
}

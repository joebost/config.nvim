return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        sorting_strategy = 'ascending', -- Or 'ascending', 'initial', 'filename'
        path_display = {
          filename_first = {
            reverse_directories = false,
          },
        },
        preview = true,
        layout_strategy = 'center',
        border = true,
        -- Simple visual tweaks:
        prompt_prefix = ' ', -- Requires a Nerd Font
        selection_caret = ' ', -- Requires a Nerd Font
        entry_prefix = '  ', -- Indent results slightly
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local themes = require 'telescope.themes'
    local builtin = require 'telescope.builtin'

    -- Example: Apply dropdown theme to specific pickers
    vim.keymap.set('n', '<leader>ss', function()
      builtin.git_files(themes.get_dropdown {
        -- You can pass theme-specific options here
        previewer = false, -- Keep previewer enabled
        winblend = 10, -- Optional: Make window slightly transparent if desired
      })
    end, { desc = '[P]roject [F]iles (Dropdown)' })

    vim.keymap.set('n', '<leader>sf', function()
      builtin.find_files(themes.get_dropdown {
        -- Example: Dropdown without a previewer
        previewer = false,
        width = 0.6, -- Make this specific dropdown smaller
      })
    end, { desc = '[S]earch [F]iles (No Preview Dropdown)' })

    -- vim.keymap.set('n', '<leader>ss', builtin.git_files, { desc = '[S]earch [S]ource files' })
    -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  end,
}

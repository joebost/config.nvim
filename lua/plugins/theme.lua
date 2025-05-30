return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      style = 'moon',
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
      transparent = false,
    }
    vim.cmd.colorscheme 'tokyonight'
  end,
}

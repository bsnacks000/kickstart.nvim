-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = { visible = true, never_show_by_pattern = { '.git' } },
        },
      }

      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
      vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
    end,
  },
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup()
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.mypy.with {
            extra_args = { '--strict' },
          },
        },
      }

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
}

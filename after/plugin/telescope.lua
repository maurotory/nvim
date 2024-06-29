local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({ no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
  -- vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
end)

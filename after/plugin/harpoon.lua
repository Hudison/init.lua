local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Harpoon [A]dd file' })
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Op[e]n Harpoon' })

vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, { desc = 'Harpoon file [1]' })
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, { desc = 'Harpoon file [2]' })
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, { desc = 'Harpoon file [3]' })
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, { desc = 'Harpoon file [4]' })
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end, { desc = 'Harpoon file [5]' })

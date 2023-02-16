require("neo-tree").setup({
	filesystem = {
		follow_current_file = true
	}
})

vim.keymap.set('n', '<leader>t', vim.cmd.NeoTreeRevealToggle, { desc = 'File [t]ree' })

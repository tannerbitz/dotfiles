return {
	-- this branch of nvim-treesitter works well with neovim 0.11.x, there is a different branch with 0.12.x
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'master',
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
		})
	end,
}

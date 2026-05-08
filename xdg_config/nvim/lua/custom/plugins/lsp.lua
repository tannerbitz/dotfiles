-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	-- LSP Configuration & Plugins
	dependencies = {
		{
			'neovim/nvim-lspconfig',
			config = function()
				local format_is_enabled = true
				vim.api.nvim_create_user_command('FormatToggle', function()
					format_is_enabled = not format_is_enabled
					print('Setting autoformatting to: ' .. tostring(format_is_enabled))
				end, {})

				vim.api.nvim_create_autocmd('LspAttach', {
					callback = function(args)
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if not client then return end

						if client.supports_method('textDocument/formatting') then
							-- Format the current buffer on save
							vim.api.nvim_create_autocmd('BufWritePre', {
								buffer = args.buf,
								callback = function()
									if not format_is_enabled then
										return
									end

									vim.lsp.buf.format {
										async = false,
										filter = function(c)
											return c.id == client.id
										end,
									}
								end,
							})
						end
					end,
				})
			end

		},
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim',           config = true },
		{ 'williamboman/mason-lspconfig.nvim', version = "v1.32.0" },

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim',                 tag = 'legacy',     opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
}

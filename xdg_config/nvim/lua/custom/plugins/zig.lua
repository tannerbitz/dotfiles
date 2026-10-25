return {
	-- Official Zig syntax/filetype support (hosted on Codeberg, not GitHub)
	url = 'https://codeberg.org/ziglang/zig.vim',
	ft = { 'zig', 'zir', 'zon' },
	init = function()
		-- zls already formats on save via the LspAttach autocmd in lsp.lua
		vim.g.zig_fmt_autosave = 0
	end,
}

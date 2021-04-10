local M = {}

-- Compe setup from @ckipp01
M.setup = function()
	local langs = {
		"scala",
		"html",
		"javascript",
		"lua",
		"java",
		"nim",
		"elixir",
		"nix",
		"javascriptreact",
		"typescript",
	}
	require("compe").setup({
		enabled = true,
		debug = false,
		min_length = 3,

		source = {
			path = true,
			buffer = true,
			vsnip = true,
			nvim_lsp = {
				priority = 1000,
				filetypes = langs,
			},
		},
	})
	-- set_keybinds()
end

return M

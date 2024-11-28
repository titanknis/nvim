-- toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {--[[ things you want to change go here]]
	},
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<SPACE>;]], -- Toggle terminal with Ctrl+\ (can be customized)
			-- direction = "float", -- Floating terminal for easy visibility
		})
	end,
}

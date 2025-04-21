return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")
		local treesitter_install = require('nvim-treesitter.install')
		treesitter_install.compilers = { "zig" }
		treesitter_config.setup({
			ensure_installed = { "lua", "javascript", "c_sharp" },
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}

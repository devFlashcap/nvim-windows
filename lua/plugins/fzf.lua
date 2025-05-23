return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	config = function()
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").files, { desc = "FzF files" })
		vim.keymap.set("n", "<leader>lr", require("fzf-lua").lsp_references, { desc = "LSP References" })
		vim.keymap.set("n", "<leader>lca", require("fzf-lua").lsp_code_actions, { desc = "LSP Code Actions" })
	end
}

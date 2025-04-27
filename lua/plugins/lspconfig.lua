---------- LSP CONFIG ----------

local function keymap(mode, l, r, opts)
	opts = opts or {}
	opts.buffer = true
	opts.desc = string.format("Lsp: %s", opts.desc)
	vim.keymap.set(mode, l, r, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("DefaultLspAttach", { clear = true }),
	callback = function()
		keymap("n", "gh", function()
			vim.lsp.buf.hover({})
		end, { desc = "Hover" })

		keymap("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle inlay hints" })

		keymap("n", "<leader>gd", function()
			vim.lsp.buf.definition()
		end, { desc = "Go to definition" })

		keymap("n", "<leader>gi", function()
			vim.lsp.buf.implementation()
		end, { desc = "Go to implementation" })

		keymap("n", "<leader>sh", function()
			vim.lsp.buf.signature_help()
		end, { desc = "Signature help" })

		keymap("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code action" })

		keymap("n", "<leader>ff", function()
			vim.lsp.buf.format()
		end, { desc = "Code action" })
	end,
})

vim.diagnostic.config({
	virtual_text = { spacing = 4, prefix = "●" },
	---@diagnostic disable-next-line: assign-type-mismatch
	float = { source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignHint",
		},
	},
})

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			handlers = {
				function(server)
					vim.lsp.enable(server)
				end,
			},
		},
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", opts = {}, cmd = "Mason", dependencies = { "roslyn.nvim" } },
		},
	},
}

local diagnostic_config = function()
    local x = vim.diagnostic.severity

    vim.diagnostic.config {
        virtual_text = { prefix = "" },
        signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
        underline = true,
        float = { border = "single" },
    }
end

return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"saghen/blink.cmp"
    },
    config = function()
        diagnostic_config()
	require("mason-lspconfig").setup({
	    handlers = {
		function(server)
		    print(server)
		    vim.lsp.config(server, require("blink.cmp").get_lsp_capabilities())
		    vim.lsp.enable(server)
		end
	    }
	})
    end
}

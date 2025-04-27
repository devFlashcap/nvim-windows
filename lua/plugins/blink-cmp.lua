return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',

	opts = {
		keymap = { preset = 'default' },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono',
		},

		fuzzy = { implementation = "lua" },
		signature = { enabled = true }
	}
}

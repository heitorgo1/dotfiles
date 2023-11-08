require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		cpp = { "clang-format" },
		terraform = { "terraform" },
		proto = { "buf" },
		sql = { "sqlfmt" },
		go = { "gofmt", "goimports" },
		rust = { "rustfmt" },
		["*"] = { "trim_whitespace" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = true,
	},
	notify_on_error = true,
})

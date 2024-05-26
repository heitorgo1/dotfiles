local slow_format_filetypes = {}

require("conform").formatters.sqlfluff = {
	inherit = false,
	command = "sqlfluff",
	cwd = require("conform.util").root_file({ ".sqlfluff" }),
	args = { "fix", "--dialect", "postgres", "-q", "--force", "$FILENAME" },
	stdin = false,
}

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		cpp = { "clang-format" },
		terraform = { "terraform_fmt" },
		proto = { "buf" },
		sql = { "sqlfluff" },
		go = { "goimports", "gofmt" },
		rust = { "rustfmt" },
		["*"] = { "trim_whitespace" },
	},
	format_on_save = function(bufnr)
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,

	format_after_save = function(bufnr)
		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = true }
	end,
	notify_on_error = true,
})

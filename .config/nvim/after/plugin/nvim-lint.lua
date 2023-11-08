require("lint").linters_by_ft = {
	markdown = { "vale" },
	python = { "flake8" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	sql = { "sqlfluff" },
	ruby = { "rubocop" },
	json = { "jsonlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

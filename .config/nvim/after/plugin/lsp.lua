local lsp = require("lsp-zero")
lsp.extend_lspconfig()

-- Make LSP tsserver and eslit use latest nodejs version instead of asdf local version
vim.env.PATH = "/home/heitor/.asdf/installs/nodejs/20.7.0/bin:" .. vim.env.PATH

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"eslint",
		"gopls",
		"pyright",
		"lua_ls",
		"solargraph",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})
require("mason-nvim-dap").setup()

local cmp = require("cmp")
local cmp_format = require("lsp-zero").cmp_format()
local cmp_action = require("lsp-zero").cmp_action()
--local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		--["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
		--["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	formatting = cmp_format,
})


-- stylua: ignore start
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
      require('nvim-navbuddy').attach(client, bufnr)
    end

    vim.keymap.set("n", "<C-b>", function() require("nvim-navbuddy").open() end, opts)
end)
-- stylua: ignore end

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Disable semantic highlighting
--for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--	vim.api.nvim_set_hl(0, group, {})
--end

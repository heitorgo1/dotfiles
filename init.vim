set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- vim.opt.termguicolors = true
    require('lualine').setup()
    require("nvim-tree").setup()
    require('leap').add_default_mappings()

    function _G.git_diff(opts)
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local conf = require("telescope.config").values
      list = vim.fn.systemlist('git diff --name-only main')

      pickers.new(opts, {
        prompt_title = "Git Diff",
        finder = finders.new_table { results = list },
        sorter = conf.generic_sorter(opts)
      }):find()
    end

EOF

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme

vim.o.relativenumber = true

M.ui = {
  theme = "ayu-dark",
}

M.plugins = {
  user = {
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      config = function()
        require "custom.plugins.treesitter"
      end,
    },
    ["kyazdani42/nvim-tree.lua"] = {
      config = function()
        require "custom.plugins.nvimtree"
      end,
    },
    ["windwp/nvim-ts-autotag"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
  },
}

return M

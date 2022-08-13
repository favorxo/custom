-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

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
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
      },
    },
    ["windwp/nvim-ts-autotag"] = {
      config = function()
        require "nvim-ts-autotag"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
  },
}

return M

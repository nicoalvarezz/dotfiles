local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pytright",
        "rust_analyzer"
      }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  }
}

return plugins
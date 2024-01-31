local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
      vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
      vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
      vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
      vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
      vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

require("impatient")
require("packer_compiled")

require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim") -- Package manager
    -- Faster startup-time
    use("lewis6991/impatient.nvim")
    -- Faster filetype.vim
    use("nathom/filetype.nvim")
    -- UI to select things (files, grep results, open buffers...)
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("settings.telescope")
      end,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Add indentation guides even on blank lines
    use("lukas-reineke/indent-blankline.nvim")
    use("kyazdani42/nvim-web-devicons")
    -- Add git related info in the signs columns and popups
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use("nvim-treesitter/nvim-treesitter")
    -- Additional textobjects for treesitter
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- Automated session(and lowkey project) management
    use({
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "info",
          auto_session_suppress_dirs = { "~/" },
        })
      end,
    })
    use({
      "rmagatti/session-lens",
      requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
      config = function()
        require("session-lens").setup({
          path_display = { "shorten" },
        })
      end,
    })
    use({
      "luukvbaal/nnn.nvim",
      config = function()
        require("nnn").setup()
      end,
    })
    use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
    use({
      "williamboman/nvim-lsp-installer",
      config = function()
        require("settings.lsp")
      end,
    }) -- Automagically install lsp-servers
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    })
    use({
      "folke/which-key.nvim",
      config = function()
        require("settings.which_key")
      end,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
        local ls = require("null-ls")
        local sources = {
          ls.builtins.formatting.stylua,
        }
        ls.setup({ sources = sources })
      end,
    })

    use("EdenEast/nightfox.nvim")

    use("romgrk/barbar.nvim")
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
  end,

  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
      prompt_border = "rounded",
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  },
})

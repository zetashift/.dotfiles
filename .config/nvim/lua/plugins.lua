return require("packer").startup(function(use)
  -- Let Packer manage itself
  use({ "wbthomason/packer.nvim", opt = true })

  -- Pretty writing
  use({ "junegunn/goyo.vim" })
  use({ "SidOfc/mkdx" })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    cmd = "MarkdownPreview",
  })

  -- Statusline: makes it look like I know what I'm doing
  use({ "hoob3rt/lualine.nvim" })
  use({ "akinsho/nvim-toggleterm.lua" })

  -- Make things look pretty
  use({ "sainnhe/gruvbox-material" })
  use({ "ayu-theme/ayu-vim" })
  use({ "norcalli/nvim-colorizer.lua" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "luochen1990/rainbow" })
  use({ "kevinhwang91/nvim-bqf" }) -- Better quickfix window

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "glepnir/lspsaga.nvim" }) -- For additional tooltips and handy dandy stuff

  -- Completions
  use({ "hrsh7th/nvim-compe", requires = { { "hrsh7th/vim-vsnip" } } })
  use({ "rafamadriz/friendly-snippets" })

  -- Text editing
  use({ "b3nj5m1n/kommentary" })
  use({ "windwp/nvim-autopairs" })
  use({ "lukas-reineke/indent-blankline.nvim", branch = "lua" })
  use({ "tpope/vim-surround" })
  use({ 'phaazon/hop.nvim'})
  use({ "junegunn/vim-easy-align" })

  -- File managing & Finding All The Things
  use({ "mhinz/vim-startify" }) -- Fancy homepage
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sql.nvim"}})
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run="make" },
      { "nvim-telescope/telescope-project.nvim" },
    },
  })

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- REPL go brrr
  use({ "hkupty/iron.nvim" })

  use({ "nvim-treesitter/nvim-treesitter" }) -- Treesitter for better understanding of code.

  use({ "scalameta/nvim-metals" }) -- Scala, scalably difficult.

  use({ "alaviss/nim.nvim" }) -- Nim, it's Python but better.

  use({ "elixir-editors/vim-elixir" }) -- Elixir, it's Ruby but better.

  use({ "gleam-lang/gleam.vim" }) -- Gleam, it's Elixir but WIP.

  use({ "mattn/emmet-vim" }) -- Autocomplete all the '<'

  use({ "LnL7/vim-nix" }) -- Nix, it's everything, but better (and difficult).
end)

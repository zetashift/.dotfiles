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

  -- Make things look pretty
  use({ "sainnhe/gruvbox-material" })
  use({ "ayu-theme/ayu-vim" })
  use({ "norcalli/nvim-colorizer.lua" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "luochen1990/rainbow" })
  use({ "hoob3rt/lualine.nvim" })
  use({ "kevinhwang91/nvim-bqf" }) -- Better quickfix window

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "glepnir/lspsaga.nvim" }) -- For additional tooltips and handy dandy stuff
  use({ "nvim-lua/lsp-status.nvim" })

  -- Completions
  use({ "hrsh7th/nvim-compe", requires = { { "hrsh7th/vim-vsnip" } } })
  use({ "rafamadriz/friendly-snippets" })
  use({ "karb94/neoscroll.nvim" }) -- Smooth scrolling

  -- Text editing
  use({ "b3nj5m1n/kommentary" })
  use({ "cohama/lexima.vim" })
  use({ "lukas-reineke/indent-blankline.nvim", branch = "lua" })
  use({ "tpope/vim-surround" })
  use({ "justinmk/vim-sneak" })
  use({ "junegunn/vim-easy-align" })

  -- File managing & Finding All The Things
  use({ "mhinz/vim-startify" }) -- Fancy homepage
  use({ "kyazdani42/nvim-tree.lua" })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
    },
  })
  use({ "akinsho/nvim-toggleterm.lua" }) -- Easy terminal toggling

  use({ "nvim-treesitter/nvim-treesitter" }) -- Treesitter for better understanding of code.

  use({ "scalameta/nvim-metals" }) -- Scala, scalably difficult.

  use({ "alaviss/nim.nvim" }) -- Nim, it's Python but better.

  use({ "elixir-editors/vim-elixir" }) -- Elixir, it's Ruby but better.

  use({ "gleam-lang/gleam.vim" }) -- Gleam, it's Elixir but WIP.

  use({ "mattn/emmet-vim" }) -- Autocomplete all the '<'

  use({ "LnL7/vim-nix" }) -- Nix, it's everything, but better (and difficult).
end)

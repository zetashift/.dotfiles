return require('packer').startup(function(use)
  -- Let Packer manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Pretty writing
  use {'junegunn/goyo.vim'}
  use {'vim-pandoc/vim-pandoc-syntax' }
  use {'vim-pandoc/vim-pandoc'}

  use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cmd = 'MarkdownPreview'
  }

  -- Make things look pretty
  use {'sainnhe/everforest'}
  use {'sainnhe/gruvbox-material'}
  use {'ayu-theme/ayu-vim'}

  use {'itchyny/lightline.vim'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'liuchengxu/vista.vim'}
  use {'luochen1990/rainbow'}


  use {'karb94/neoscroll.nvim'} -- Smooth scrolling
  -- Text editing
  use {'LunarWatcher/auto-pairs'}
  use {'b3nj5m1n/kommentary'}
  use {'tpope/vim-endwise'} -- Used for `end` blocks in Elixir etc.

  -- use {'sheerun/vim-polyglot'}
  use {'lukas-reineke/indent-blankline.nvim', branch ="lua"}
  use {'tpope/vim-surround'}
  -- Align text
  use {'junegunn/vim-easy-align'}

  -- File managing & projects
  use {'mhinz/vim-startify'} -- Fancy homepage
  use {'preservim/nerdtree'}
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'akinsho/nvim-toggleterm.lua'} -- Easy terminal toggling

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'glepnir/lspsaga.nvim'} -- For additional tooltips and handy dandy stuff
  -- Completions
  use {'hrsh7th/nvim-compe', requires = {{'hrsh7th/vim-vsnip'}}}

  -- Treesitter for fancy highlighting features
  use {'nvim-treesitter/nvim-treesitter'}
  -- Scala
  use {'scalameta/nvim-metals'}

  -- Nim
  use {'zah/nim.vim'}
  -- Elixir
  use {'elixir-editors/vim-elixir'}

  -- Other languages
  use {'sheerun/vim-polyglot'}
end)

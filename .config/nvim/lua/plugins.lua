return require('packer').startup(function(use)
  -- Let Packer manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Pretty writing
  use {'junegunn/goyo.vim'}
  --[[ use {'godlygeek/tabular'}
  use {'plasticboy/vim-markdown'} ]]
  use {'vim-pandoc/vim-pandoc'}
  use {'vim-pandoc/vim-pandoc-syntax' }
  use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cmd = 'MarkdownPreview'
  } 

  -- Make things look pretty
  use {'morhetz/gruvbox'}
  use {'itchyny/lightline.vim'}
  use {'norcalli/nvim-colorizer.lua'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'liuchengxu/vista.vim'}
  use {'luochen1990/rainbow'}
  
  -- Text editing
  use {'jiangmiao/auto-pairs'}
  use {'b3nj5m1n/kommentary'}
  -- use {'sheerun/vim-polyglot'}
  use {'lukas-reineke/indent-blankline.nvim', branch ="lua"}
  use {'tpope/vim-surround'}
  
  -- Align text
  use {'junegunn/vim-easy-align'}

  -- File managing & projects
  use {'preservim/nerdtree'}

  -- Completions
  use {'hrsh7th/nvim-compe', requires = {{'hrsh7th/vim-vsnip'}}}

  -- Scala
  use {'scalameta/nvim-metals'}
end)

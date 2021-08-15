(module magic.plugin
  {autoload { packer packer }})

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well.

  This is just a helper / syntax sugar function to make interacting with packer
  a little more concise."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (use (assoc opts 1 name))))))))

(defn- req [name]
  "A shortcut to building a require string for your plugin
  configuration. Intended for use with packer's config or setup
  configuration options. Will prefix the name with `magic.plugin.`
  before requiring."
  (.. "require('magic.plugin." name "')"))

(use
  ;;; LSP and Treesitter
  :neovim/nvim-lspconfig { :config (req :lsp) }                   ;; Easy LSP configuration
                           
  :jose-elias-alvarez/null-ls.nvim {}                             ;; General purpose languageserver
  :glepnir/lspsaga.nvim {}                                        ;; Actions that for LSP
  :folke/trouble.nvim   {}                                        ;; Pretty diagnostics
  :nvim-treesitter/nvim-treesitter { :config (req :treesitter)
                                     :as :treesitter }            ;; Fine-grained structural editing for everyone

  :nvim-treesitter/playground {}                                  ;; Actually see the fine-grained structure!
  :windwp/nvim-ts-autotag {}                                      ;; Autoclose and autorename html tags
  :simrat39/symbols-outline.nvim {}                               ;; Show LSP symbols in a tree

  ;; Editor goodies
  :nvim-lua/plenary.nvim {}                                       ;; Make writing plugins easier!
  ; :TimUntersberger/neogit { :config (req :neogit) }             ;; Magit for neovim
  :kyazdani42/nvim-tree.lua {}                                    ;; Treemacs for my cute NeoVim
  :folke/which-key.nvim { :config (req :which-key) }
  :vhyrro/neorg { :config (req :neorg) }
  :hrsh7th/nvim-compe   { :as :compe                              ;; Autocompletion/Snippets so I don't use my brain
                          :config (req :compe)
                          :requires :hrsh7th/vim-vsnip }

  :rafamadriz/friendly-snippets {}                                ;; Snippets collection
  :folke/zen-mode.nvim { :config (req :zen-mode)                  ;; Zen Mode
                         :event :BufWinEnter }

  ;; Eyecandy
  :windwp/nvim-autopairs { :config (req :auto-pairs) }                                  ;; Autopair with treesitter
  :zetashift/gruvbox-flat.nvim {}                                                       ;; Objectively subjectively the best theme
  :hoob3rt/lualine.nvim { :config (req :lualine) }                                      ;; Displays stuff that I don't read anyway
  :lewis6991/gitsigns.nvim { :config (req :gitsigns) }                                  ;; Pretty colors for Git changes
  :kyazdani42/nvim-web-devicons { :config (req :web-devicons) }                         ;; Pretty icons!
  :lukas-reineke/indent-blankline.nvim { :config (req :indent-blankline) }              ;; Pretty indent guides 
  :p00f/nvim-ts-rainbow { :requires :treesitter }                                       ;; Use tree-sitter for pretty brackets

  :norcalli/nvim-colorizer.lua { :event :BufEnter :config (req :colorizer) }            ;; Inline color highlighters

  ;; Text editing
  :ggandor/lightspeed.nvim {}                                      ;; Supercharged EasyMotion, using Fennel
  :b3nj5m1n/kommentary {}                                          ;; Commenting made easy
  :junegunn/vim-easy-align {}                                      ;; Aligning text made easy
  :tpope/vim-repeat {}                                             ;; Repeat motions using `.`
  :tpope/vim-surround {}                                           ;; Surround text with pairs

  :akinsho/nvim-bufferline.lua { :config (req :bufferline) }       ;; A solid bufferline
  :akinsho/nvim-toggleterm.lua { :config (req :toggleterm) }       ;; Toggling terminals
  :rmagatti/auto-session { :config (req :sessions) }               ;; Sessions
  :beauwilliams/focus.nvim {}                                      ;; Effortless splitting

  ;;; Programming languages
  :scalameta/nvim-metals { :config (req :metals) }                ;; It's Java but better!
  :alaviss/nim.nvim {}                                            ;; It's Python but better!

  ;; Telescope for fast searching everything
  :nvim-telescope/telescope-project.nvim    {}
  :nvim-telescope/telescope-fzf-native.nvim { :run :make }
  :nvim-telescope/telescope-frecency.nvim   { :requires :tami5/sql.nvim }
  :nvim-telescope/telescope.nvim            { :requires :nvim-lua/popup.nvim :config (req :telescope) }

  :Olical/aniseed {}                                              ;; Fennel, the better Lua for NeoVim
  :Olical/conjure {}                                              ;; NeoEmacs

  ;; Libraries
  :wbthomason/packer.nvim {}                                      ;; A very nice package manager
  )

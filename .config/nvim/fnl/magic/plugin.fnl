(module magic.plugin
  {autoload {nvim aniseed.nvim
             core aniseed.core
             packer packer}})

;; Thanks to Olical and camspiers!
(fn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :magic.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(fn use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup (fn [use use-rocks]
                      (for [i 1 (core.count pkgs) 2]
                        (let [name (. pkgs i)
                              opts (. pkgs (+ i 1))]
                          (-?> (. opts :mod) (safe-require-plugin-config))
                          (if (. opts :rock)
                              (use-rocks name)
                              (use (core.assoc opts 1 name)))))))))

(defn req [name]
  "A shortcut to building a require string for your plugin
  configuration. Intended for use with packer's config or setup
  configuration options. Will prefix the name with `magic.plugin.`
  before requiring."
  (.. "require('magic.plugin." name "')"))

(use
  :Olical/aniseed {}                                  ;; Fennel, the better Lua for NeoVim
  :Olical/conjure {}                                  ;; NeoEmacs
  :tami5/compe-conjure {}                             ;; Even easier Lisping in NeoVim

  ;;; LSP and Treesitter
  :neovim/nvim-lspconfig {:mod :lsp}                  ;; Easy LSP configuration
  :jose-elias-alvarez/null-ls.nvim {}                 ;; General purpose languageserver
  :glepnir/lspsaga.nvim {}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter} ;; Fine-grained structural editing for everyone
  :nvim-lua/lsp-status.nvim {}                        ;; Statusline LSP components

  ;; Editor goodies
  :nvim-lua/plenary.nvim {}                           ;; Make writing plugins easier!
  :rmagatti/auto-session {:mod :sessions}             ;; Seamless automatic session management
  :kyazdani42/nvim-tree.lua {}                        ;; Treemacs for my cute NeoVim
  :folke/which-key.nvim {:mod :which-key}             ;; Guided transcendence 
  :camspiers/snap.nvim {:mod :snap}                   ;; Fast search everything!
  :hrsh7th/nvim-compe {:mod :compe
                       :requires :hrsh7th/vim-vsnip}  ;; Autocompletion/Snippets so I don't use my brain
  :rafamadriz/friendly-snippets {}                    ;; Snippets collection
  :folke/zen-mode.nvim {:mod :zen-mode}               ;; Zen Mode

  ;; Eyecandy
  :windwp/nvim-autopairs {:mod :auto-pairs}           ;; Autocomplete even the tiniest things
  :p00f/nvim-ts-rainbow {}                            ;; Use tree-sitter for
  :eddyekofo94/gruvbox-flat.nvim {}
  :sainnhe/gruvbox-material {}                        ;; Subjectively objectively the best theme
  :hoob3rt/lualine.nvim {:mod :lualine}               ;; Displays stuff that I don't read anyway
  :lewis6991/gitsigns.nvim {:mod :gitsigns}           ;; Pretty colors for Git changes
  :kyazdani42/nvim-web-devicons {:mod :web-devicons}  ;; Pretty icons!
  :lukas-reineke/indent-blankline.nvim {:branch :lua  ;; Pretty indent guides 
                                        :mod :indent-blankline}

  ;;; Text editing
  :ggandor/lightspeed.nvim {}                            ;; Supercharged EasyMotion, using Fennel
  :liuchengxu/vim-better-default {:mod :better-default}  ;; Better defaults
  :mbbill/undotree {}                                    ;; See my mistakes in a tree view!
  :b3nj5m1n/kommentary {}                                ;; Commenting made easy
  :guns/vim-sexp {}                                      ;; Precision editing for S-expressions
  :junegunn/vim-easy-align {}                            ;; Aligning text made easy
  :tpope/vim-eunuch {}                                   ;; Unix helpers for operations
  :tpope/vim-repeat {}                                   ;; Repeat motions using `.`
  :tpope/vim-sleuth {}                                   ;; Automatic indentation settings
  :tpope/vim-surround {}                                 ;; Surround text with pairs

  :akinsho/nvim-toggleterm.lua {:mod :toggleterm}        ;; Toggling terminals with ease

  ;;; Programming languages
  :scalameta/nvim-metals {:mod :metals}                  ;; It's java but better!
  :alaviss/nim.nvim {}                                   ;; Nim, it's Python but better!

  :wbthomason/packer.nvim {}                             ;; A very nice package manager
  )

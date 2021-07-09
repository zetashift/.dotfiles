(module magic.init
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.

;;; Theme settings for gruvbox-flat
(set nvim.o.termguicolors true)
(set vim.g.gruvbox_italic_keywords false)
(nvim.ex.colorscheme :gruvbox-flat)


(require :magic.options)     ;; Here we set all our (Neo)Vim editor settings
(require :magic.keybindings) ;; Here we set up our keybindings/mappings
(require :magic.plugin)      ;; Here we list our plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim

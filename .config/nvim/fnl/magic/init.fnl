(module magic.init
  {autoload {nvim aniseed.nvim
             core aniseed.core}})


;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.

(require :magic.options)     ;; Here we set all our (Neo)Vim editor settings
(require :magic.keybindings) ;; Here we set up our keybindings/mappings
(require :magic.plugin)      ;; Here we list our plugins
;; Run script/sync.sh to update, install and clean your plugins.

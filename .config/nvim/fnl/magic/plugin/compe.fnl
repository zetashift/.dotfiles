(module magic.plugin.compe
  {autoload {nvim aniseed.nvim
             compe compe}})

;; Setup compe with desired settings
(compe.setup {:enabled       true
              :autocomplete  true
              :min_length    1
              :documentation true
              :preselect     :disable
              :source {
                       :path true
                       :buffer true
                       :vsnip true
                       :nvim_lsp true
                       :spell false
                       :treesitter true
                       :tags true}
              })

;; Setup keybindings for compe's autocompletion menu
(fn map [lhs rhs]
              (nvim.set_keymap :i lhs rhs {:noremap true :silent true :expr true}))

(map :<C-Space> "compe#complete()")
(map :<CR> "compe#confirm('<CR>')")
(map :<C-e> "compe#close('<C-e>')")



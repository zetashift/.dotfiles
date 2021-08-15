(module magic.plugin.metals
  {autoload {nvim aniseed.nvim} require-macros [magic.macros]})

;; The Metals config is global and passed along the `initialize_or_attach`
(fn _G.metals_init []
  (let [metals (require :metals)
        conf metals.bare_config ]
    (tset conf :init_options { :statusBarProvider :on })

    (tset conf :settings { :showImplicitArguments    true
                           :showInferredType         true
                           :fallbackScalaVersion     :3.0.1
                           :superMethodLensesEnabled true   })

    (metals.initialize_or_attach conf)))

;; So Metals picks up our Metals version
(augroup lsp
         (nvim.ex.autocmd "FileType scala,sbt :call v:lua.metals_init()" ))

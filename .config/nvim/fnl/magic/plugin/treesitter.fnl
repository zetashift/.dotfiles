(module magic.plugin.treesitter
  {autoload {config nvim-treesitter.configs}})

;; Treesitter sets up indentation, bracket colorization and highlighting (and more!)
(local colors [ :#FFD700 :#da70d6 :#b16286 :#d79921 :#689d6a ])

(config.setup {
               :highlight  { :enable true }
               :playground {:enable true
                            :disable {}
                            :updatetime 25
                            :persist_queries false
                            :keybindings { :toggle_query_editor :o
                                           :toggle_hl_groups :i
                                           :toggle_injected_languages :t
                                           :toggle_anonymous_nodes :a
                                           :toggle_language_display :I
                                           :focus_language :f
                                           :unfocus_language :F
                                           :update :R
                                           :goto_node :<cr>
                                           :show_help "?" }
                            }

               :autopairs { :enable true }
               :autotag   { :enable true }

               :rainbow {:enable false
                         :extended_mode true
                         :max_file_lines 10000
                         :colors colors
               }})


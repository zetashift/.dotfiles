(module magic.plugin.auto-pairs
  {autoload {npairs nvim-autopairs
             rule nvim-autopairs.rule }})

(npairs.setup {})

;; Setup auto-pairs with compe <CR>
(local compe (require :nvim-autopairs.completion.compe))
(compe.setup { :map_cr true :map_complete true })

;; Add { | } spacing rule
(npairs.add_rules [ (: (rule " " " ") :with_pair
                        (fn [opts]
                          (let [pair (opts.line:sub (- opts.col 1) opts.col)]
                            (vim.tbl_contains [ "()" "[]" "{}"] pair))))
                    (: (: (: (rule "( " " )") :with_pair
                              (fn []
                                false)) :with_move
                           (fn [opts]
                             (not= (opts.prev_char:match ".%)") nil)))
                        :use_key ")")
                    (: (: (: (rule "{ " " }") :with_pair
                              (fn []
                                false)) :with_move
                           (fn [opts]
                             (not= (opts.prev_char:match ".%}") nil)))
                        :use_key "}")
                    (: (: (: (rule "[ " " ]") :with_pair
                              (fn []
                                false)) :with_move
                           (fn [opts]
                             (not= (opts.prev_char:match ".%]") nil)))
                        :use_key "]") ])

(module magic.plugin.auto-pairs
  {autoload {nvim aniseed.nvim
             npairs nvim-autopairs
             rule nvim-autopairs.rule }})

(npairs.setup {})

;; Setup auto-pairs with compe <CR>
(local compe (require :nvim-autopairs.completion.compe))
(compe.setup { :map_cr true :map_complete true })

;; Add { | } spacing rule
(local spaceRule (rule " " " "))
(npairs.add_rules [ (: spaceRule :with_pair
                        (fn [opts]
                          (let [pair (opts.line:sub opts.col (+ opts.col 1))]
                            (vim.tbl_contains [ "()" "[]" "{}" ] pair))))])

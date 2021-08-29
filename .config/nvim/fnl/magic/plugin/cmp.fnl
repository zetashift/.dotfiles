(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim
             cmp cmp}})

(cmp.setup { :sources
              [ { :name :buffer } { :name :path } { :name :nvim_lsp } { :name :luasnip } ]

             :snippet { :expand (fn [args] ((. (require :luasnip) :lsp_expand) args.body)) }
})

((. (require :luasnip/loaders/from_vscode) :lazy_load) {:paths  ["~/.local/share/nvim/site/pack/packer/start/friendly-snippets"]})



(module magic.plugin.tabout
  {autoload {tabout tabout}})

(local luasnip (require :luasnip))

(tabout.setup { :tabkey ""
                :ignore_beginning false
                :act_as_tab true })

(fn replace-keycodes [str]
  (vim.api.nvim_replace_termcodes str true true true))

(fn _G.tab_binding []
  (if (not= (vim.fn.pumvisible) 0) (replace-keycodes :<C-n>)
      (luasnip.expand_or_jumpable)
      (replace-keycodes "<Plug>luasnip-expand-or-jump")
      (replace-keycodes "<Plug>(Tabout)")))

(fn _G.s_tab_binding []
  (if (not= (vim.fn.pumvisible) 0) (replace-keycodes :<C-p>)
      (luasnip.jumpable (- 1))
      (replace-keycodes "<Plug>(vsnip-jump-prev)")
      (replace-keycodes "<Plug>(TaboutBack)")))

(vim.api.nvim_set_keymap :i :<Tab> "v:lua.tab_binding()"     {:expr true})
(vim.api.nvim_set_keymap :i :<S-Tab> "v:lua.s_tab_binding()" {:expr true})

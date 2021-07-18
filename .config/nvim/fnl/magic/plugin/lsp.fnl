(module magic.plugin.lsp
  {autoload { lspconfig lspconfig
              lspsaga lspsaga
              null-ls null-ls
              trouble trouble }})

;; Setup null-ls as general language server with the follow `sources`
(local sources [null-ls.builtins.formatting.prettier null-ls.builtins.formatting.black])
(null-ls.setup { :sources sources })

;; Setup lspsaga for some LSP enhancements
(lspsaga.init_lsp_saga {
                        :server_filetype_map { :metals       [:sbt :scala] }
                        :code_action_prompt  { :virtual_text false }
                        })

;; Setup diagnostics and capabilities and all that jazz for lspconfig
;; Honestly I have no real idea what all of this _actually_ does.
(local diagnostics {:virtual_text true
                    :signs true
                    :underline true })

(local cap (vim.lsp.protocol.make_client_capabilities))
(tset cap.textDocument.completion.completionItem :snippetSupport true)

(local handlers { :textDocument/publishDiagnostics (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics diagnostics )})

(set lspconfig.util.default_config (vim.tbl_extend :force lspconfig.util.default_config {:handlers     handlers
                                                                                         :capabilities cap }))

;; JavaScript and TypeScript
(lspconfig.tsserver.setup { :filetypes { :javascript :typescript :javascriptreact :typescriptreact }})

;; Python
(lspconfig.pyright.setup {})

;; Nim
(lspconfig.nimls.setup {})

;; Nix
(lspconfig.rnix.setup {})

;; Vue files
(lspconfig.vuels.setup {})

;; Lua
(lspconfig.sumneko_lua.setup {})

;; Show a pretty list of LSP diagnostics
(trouble.setup {})

;; Show LSP symbols in a treeview
(set vim.g.symbols_outline {
                            :highlight_hovered_item true
                            :show_guides true
                            :auto_preview true
                            :position :right
                            :show_numbers false
                            :show_relative_numbers false
                            :show_symbol_details true
                            :keymaps {
                                      :close          :<Esc>
                                      :goto_location  :<CR>
                                      :focus_location :o
                                      :hover_symbol   :<C-space>
                                      :rename_symbol  :r
                                      :code_actions   :a
                                     }
                           :lsp_blacklist {}
                           })

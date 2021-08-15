(module magic.keybindings
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             core aniseed.core
             wk which-key}})

;; Leader keys a la Spacemacs/Doom Emacs
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")


(defn- map [mode from to opts]
  ;; "Sets a mapping with `opts` passed through"
  (var options { :noremap true :silent true })
  (when opts
    (set options (vim.tbl_extend :force options opts)))
  (vim.api.nvim_set_keymap mode from to options)
)

;; Use tab to shift through snippets and suggestions
(vim.cmd "imap <expr> <Tab>     pumvisible() ? '<C-n>' : vsnip#jumpable(1)    ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
(vim.cmd "imap <expr> <S-Tab>   pumvisible() ? '<C-p>' : vsnip#jumpable(-1)   ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
(vim.cmd "smap <expr> <Tab>     vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
(vim.cmd "smap <expr> <S-Tab>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")

;; Map escape to get out of terminal insert mode
(map :t :<Esc> "<C-\\><C-n>" {})

;; Map for dealing with word wrap
(map :n :k "v:count ? 'k' : 'gk'" { :expr true })
(map :n :j "v:count ? 'j' : 'gj'" { :expr true })

;; EasyAlign mappings
(map :x :ga "<Plug>(EasyAlign)" {})
(map :n :ga "<Plug>(EasyAlign)" {})

;; Which-key bindings!
(wk.register {
              :<leader> {
                :<leader> [":lua require('magic.plugin.telescope').browse_files()<CR>" "Find file in project"]

                "." [":Telescope find_files<CR>"    "Find files"]
                }

              :<leader>f {
                ;; File navigation related bindings and finding
                :name :file

                :b [":lua require('magic.plugin.telescope').buffer_find()<CR>"       "Find in buffer"]

                :f [":lua require('magic.plugin.telescope').find_file()<CR>"         "Grep through project"]
                :g [":lua require('magic.plugin.telescope').live_grep()<CR>"         "Find through Git files"]
                :n [":lua require('magic.plugin.telescope').search_notes()<CR>"      "Search notes" ]
                :P [":lua require('magic.plugin.telescope').search_dotfiles()<CR>"   "Browse config"]
                :r [":lua require('magic.plugin.telescope').recent_files()<CR>"      "Recent files"]
                :s [":w<CR>"                                                         "Save file"]
                :t [":NvimTreeToggle<CR>"                                            "Toggle NvimTree"]
                :w [":lua require('telescope.builtin').grep_string()<CR>"            "Grep current word"]
              }

              :<leader>w {
                ;; Window navigation related keybindings
                :name :window

                :d [":bdelete<CR>"              "Close window"]
                :h [":FocusSplitLeft<CR>"       "Move to window left"]
                :k [":FocusSplitUp<CR>"         "Move to window above"]
                :j [":FocusSplitDown<CR>"       "Move to window below"]
                :l [":FocusSplitRight<CR>"      "Move to window right"]
                :n [":FocusSplitNicely<CR>"     "Create new window"]
                :w ["<C-w>w"                    "Cycle window"]
              }

              :<leader>b {
                ;; Buffer navigation bindings
                :name :buffer

                :b [":Telescope buffers show_all_buffers=true sort_lastused=true<CR>" "Browse buffers"]
                :c [":enew<CR>"                                                       "Create buffer"]
                :d [":bdelete<CR>"                                                    "Kill current buffer"]
                :f [":<C"]
                :n [":BufferLineCycleNext<CR>"                                        "Next buffer"]
                :p [":BufferLineCyclePrev<CR>"                                        "Previous buffer"]
              }


              :<leader>c {
                ;; LSP related keybindings
                :name "lsp"

                :a  ["<cmd>lua require'lspsaga.codeaction'.code_action()<CR>"               "Code action"]
                :d  [vim.lsp.buf.declaration                                                "Go to definition"]
                :D  [vim.lsp.buf.definition                                                 "Go to type definition"]
                :f  [vim.lsp.buf.formatting                                                 "Format buffer"]
                :h  ["<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>"               "Hover doc"]
                :i  [vim.lsp.buf.implementation                                             "Go to implementation"]
                :k  ["<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>"         "Signature help"]
                :n  [vim.lsp.diagnostic.get_line_diagnostic                                 "Show line diagnostic"]
                :r  [vim.lsp.buf.references                                                 "Go to references"]
                :R  ["<cmd>lua require'lspsaga.rename'.rename()<CR>"                        "Rename"]
                :s  [":SymbolsOutline<CR>"                                                  "LSP Symbols"]
                :x  [":TroubleToggle<CR>"                                                   "List diagnostic"]
                "]" ["<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>"  "Next LSP diagnostic"]
                "[" ["<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>"  "Previous LSP diagnostic"]
              }



              :<leader>h {
                :name :help

                :m [":messages<CR>" :Messages]
              }

              :<leader>q {
                   :name :quit

                   :q [":wqa<CR>" "Quit"]
              }


              :<leader>p {
                :name :project

                :p ["<cmd>lua require('magic.plugin.telescope').list_projects()<CR>"  "List projects"]
              }

              :<leader>t {
                :name :toggle

                :f [":FocusToggle<CR>"                   "Toggle Focus Splitting"]
                :t [":ToggleBuftabline<CR>"              "Toggle Buffer line"]
                :w [":set wrap linebreak nolist<CR>"     "Soft wrap"]
                :z [":ZenMode<CR>"                       "Toggle Zen Mode"]
              }

              :g {
                ;; Setup some go-to shortcuts
                :name :go

                :d  [vim.lsp.buf.definition                                         "Go to definition"]
                :D  [vim.lsp.buf.type_definition                                    "Go to type definition"]
                :r  [vim.lsp.buf.references                                         "Go to references"]
                :h  ["<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>"       "Hover doc"]
              }
})

;; Paste until end binding
(wk.register {:Y  ["y$"  "Yank until end of line"]})


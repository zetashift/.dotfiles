(module magic.plugin.lualine
  {autoload {lualine lualine}})

(lualine.setup {
                :options {:theme :gruvbox-flat
                          :icons_enabled true}

                :sections {
                           :lualine_a [ [:mode { :upper true } ] ]
                           :lualine_b [ [:branch { :icon "" } ] ]
                           :lualine_c [ [:filename { :filestatus true } :filetype] ]
                           ; :lualine_x [ [:diagnostics { :color_error "#FFA500" } {:sources [ :nvim_lsp ]} ] ]
                           :lualine_y [ ["g_metals_status" "bo:filetype"] ]
                           :lualine_z [ :location ]
                           }
                })

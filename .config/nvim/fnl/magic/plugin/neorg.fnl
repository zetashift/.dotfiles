(module magic.plugin.neorg
  {autoload {neorg neorg}})

(neorg.setup {
              load {
                    :core.defaults {}
                    :core.norg.concealer {}
                    :core.norg.dirman {
                                       :config {
                                                :workspaces {
                                                             :my_workspace "~/dev/vaults"
                                                             }
                                                }
                                       }
                    }
              })

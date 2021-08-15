(module magic.plugin.neorg
  {autoload {norg neorg}})

(norg.setup {
  :load {
    :core.defaults {}
    :core.norg.concealer {}
    :core.norg.dirman {
      :config { :workspaces { :vaults "~/dev/vaults" } }
    }
  }
})

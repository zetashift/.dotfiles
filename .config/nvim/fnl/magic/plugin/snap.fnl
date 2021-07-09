(module magic.plugin.snap
  {autoload {snap snap}})

(local config snap.config)
(local file (config.file:with {:suffix "»" :consumer :fzf}))
(local vimgrep (config.vimgrep:with { :limit 50000 }))
(local args ["--hidden" "--iglob" "!{.git/*, .metals/*, .bloop/*}"])
(local fzf (snap.get :consumer.fzf))
(fn config [] (.. (vim.fn.stdpath :config) "/fnl/magic"))

(snap.map :<leader><leader>
          (file { :prompt "Find file"
                  :args   args
                  :try    [:ripgrep.file] })
          { :command :find-files})

(snap.map :<leader>ff
          (vimgrep { :prompt "Search in project"
                     :args [ "--iglob" "!{.git/*}" ] }))

(snap.map :<leader>fP
          (file { :prompt "Neovim Config"
                  :producer :ripgrep.file
                  :args [ (config) ]})
          { :command :find-config })

(snap.map :<leader>bb
          (file { :prompt "Buffers"
                  :producer :vim.buffer })
          { :command :find-buffers })

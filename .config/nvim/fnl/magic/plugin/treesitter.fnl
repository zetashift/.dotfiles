(module magic.plugin.treesitter
  {autoload {config nvim-treesitter.configs}})

;;; Treesitter sets up indentation, bracket colorization and highlighting (and more!)
(local colors [ :#FFD700 :#da70d6 :#b16286 :#d79921 :#689d6a ])

(config.setup {
               :highlight {:enable true}
               :rainbow {:enable true
                         :extended_mode true
                         :max_file_lines 10000
                         :colors colors
               }})

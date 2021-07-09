(module magic.plugin.metals
  {autoload {nvim aniseed.nvim} require-macros [magic.macros]})

;; So Metals picks up our Metals version
(set vim.g.metals_use_global_executable true)
(augroup lsp
         (nvim.ex.autocmd "FileType scala,sbt lua require('metals').initialize_or_attach({})" ))

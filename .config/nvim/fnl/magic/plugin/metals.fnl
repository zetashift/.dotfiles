(module magic.plugin.metals
  {autoload {nvim aniseed.nvim} require-macros [magic.macros]})

;; So Metals picks up our Metals version
(augroup lsp
         (nvim.ex.autocmd "FileType scala,sbt lua require('metals').initialize_or_attach({})" ))


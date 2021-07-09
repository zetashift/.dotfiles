(module magic.plugin.indent-blankline
  {autoload {nvim aniseed.nvim}})

(set vim.wo.colorcolumn :99999)
(set vim.g.indent_blankline_char "│")
(set vim.g.indent_blankline_buftype_exclude [:terminal])
(set vim.g.indent_blankline_filetype_exclude [:fennel])

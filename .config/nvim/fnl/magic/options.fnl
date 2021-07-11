(module magic.options
  {autoload {nvim aniseed.nvim}})

;; (Neo)Vim related options
(nvim.ex.set :list)
(nvim.ex.autocmd "BufNewFile,BufRead *.sc set filetype=scala")

(set nvim.o.mouse :a)
(set vim.o.hlsearch false)
(set vim.o.completeopt "menuone,noinsert,noselect")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(: (vim.opt_global.shortmess:remove :F) :append :c)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)
(set nvim.o.signcolumn :yes)
(set nvim.o.tabstop 2)
(set nvim.o.shiftwidth 2)


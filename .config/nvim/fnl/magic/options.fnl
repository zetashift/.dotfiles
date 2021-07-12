(module magic.options
  {autoload {nvim aniseed.nvim}})

;; Theme
(set nvim.o.termguicolors true)
(set vim.g.gruvbox_italic_keywords false)
(nvim.ex.colorscheme :gruvyflat)

;; (Neo)Vim related options
(nvim.ex.set :list)
(nvim.ex.autocmd "BufNewFile,BufRead *.sc set filetype=scala")

(set vim.o.hlsearch false)
(set nvim.o.mouse :a)
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.inccommand :split)
(set nvim.o.signcolumn :yes)
(set nvim.o.tabstop 2)
(set nvim.o.shiftwidth 2)
(set vim.o.completeopt "menuone,noinsert,noselect")
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")

(: (vim.opt_global.shortmess:remove :F) :append :c)


(module magic.options
  {autoload {nvim aniseed.nvim}})

;; Theme
(set nvim.o.termguicolors true)
(set vim.g.gruvbox_italic_keywords false)
(nvim.ex.colorscheme :gruvbox-flat)

;; (Neo)Vim related options
(nvim.ex.set :list)
(nvim.ex.autocmd "BufNewFile,BufRead *.sc set filetype=scala")

(set vim.o.hlsearch false)
(nvim.ex.set :number)
(nvim.ex.set :wrap)
(nvim.ex.set "wildmode=full")
(nvim.ex.set "wildoptions=pum")
(nvim.ex.set "listchars-=eol:↵")

(nvim.ex.set               "clipboard+=unnamedplus")
(nvim.ex.set               :norelativenumber)
(set nvim.o.mouse          :a)
(set nvim.o.updatetime     250)
(set vim.o.hidden          true)
(set nvim.o.timeoutlen     500)
(set nvim.o.inccommand     :split)
(set nvim.o.signcolumn     :yes)
(set nvim.o.tabstop        2)
(set nvim.o.shiftwidth     2)
(vim.cmd                   "set undofile")
(set vim.o.completeopt     "menuone,noinsert,noselect")
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")

(: (vim.opt_global.shortmess:remove :F) :append :c)


-- This config is made possible by the people in the Doom Emacs Discord
local cmd = vim.cmd
local g = vim.g
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

cmd [[packadd packer.nvim]]

-----------------
--Plugins Setup--
-----------------
require 'plugins'

g.rainbow_active = 1

-- Theming
vim.o.termguicolors = true
g.onedark_terminal_italics = 2
cmd 'colorscheme gruvbox'

-- Status Bar
g.lightline = { colorscheme = 'gruvbox';
 active = { left = { { 'mode', 'paste' }, { 'gitbranch','readonly', 'filename', 'modified' } } };
}

-- Globals
local indent = 2
g['conceallevel'] = 3
cmd 'filetype plugin on'
cmd 'syntax on'
cmd 'set nocompatible'

vim.o.expandtab = true
vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.wrap = true
vim.o.linebreak = true
vim.o.confirm = true -- Don't fail the command but give a prompt
vim.o.hidden = true -- Do not save when switching buffers
vim.wo.number = true -- Enable line numbers by default

-- Case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview panes are opened below
g.splitbelow = 0

g.smartindent = true
g['smarttab'] = true

vim.o.autoread = true -- Reload files  changed outside of vim

-- Some markdown globals
cmd([[autocmd FileType markdown setlocal textwidth=80]])

-- Globals End Here!

-- Keybindings, using Spacemacs-esque bindings
g.mapleader = " " -- Here we set our leader to <Space>!

-- Helper function to map keybindings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>fs', ':w<CR>') -- Saving files
map('n', '<leader>qq', ':q<CR>') -- Quit a file
map('n', '<leader>fed', ':e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>ft', ':NERDTreeToggle<CR>')
map('n', '<leader>bd', ':bdelete<CR>') -- Buffers
map('n', '<leader>bb', ':buffers<CR>:buffer<Space>')
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bN', ':enew<CR>')
map('n', '<leader>ww', '<C-w>w')
map('n', '<leader>tz', ':Goyo<CR>')

-- Scala Metals Setup
cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
cmd [[augroup end]]

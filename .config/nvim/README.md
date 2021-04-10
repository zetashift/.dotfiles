---
title: NeoVim Lua config
---

# Introduction

Here is my "full" Lua config for [NeoVim](https://neovim.io/). 
I try to use Lua plugins where possible, so I can avoid learning **VimL**.
I also try to use **Spacemacs / Doom Emacs**-esque keybindings. But since this is my first config from the ground up, it's kind of an amalgamation of everything.

This config is mostly based on the excellent configs from [ckipp](https://github.com/ckipp01/dots/tree/master/nvim/.config/nvim), [mjlbach](https://github.com/mjlbach/nix-dotfiles/tree/master/nixpkgs/configs/neovim) and [yeet](https://github.com/jeetelongname/dotfiles/tree/master/config/neovim). Ironically [Doom Emacs](https://github.com/hlissner/doom-emacs) and their Discord helped me a lot creating all of this.

# Structure

```
nvim
├── init.lua
├── lua
│   ├── keybindings.lua
│   ├── plugins.lua
│   └── settings
│       ├── compe.lua
│       ├── lsp.lua
│       └── telescope.lua
```

- `init.lua` is the main entry point, and it contains globals, `setup()` calls for plugins, global editor options like `signcolumn` and `expandtab`, and more settings that don't really require their own config.
- `keybindings.lua` contains all the major keybindings I need for swift editing and navigation.
- `plugins.lua` using [packer](https://github.com/wbthomason/packer.nvim), this file specifies all the plugins I need.
- The `settings` directory contains Lua modules that specify settings/functions for certain plugins so `init.lua` doesn't get too massive. For example `compe.lua` contains code setting up [nvim-compe](https://github.com/hrsh7th/nvim-compe).

# Plugins

- Nvim-tree for file management
- Telescope.nvim for fuzzy finding and project management
- nvim-lspconfig to set up LSP clients easier.
- Nim, Elixir, Scala, Javascript extensions.
- Other small plugins to make things a bit nicer, these aren't hard requirements for a functional editor, but hey I like comfy stuff.

## File management and finding files.

I use [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) for a tree based file manager. Not the most efficient way of moving around in big projects but for small projects, it's wonderful.

For finding files in current working directories I use: [Telescope](https://github.com/nvim-telescope). Telescope can do a lot more and from my superficial messing around, it's wonderful and one of the major reasons why I like NeoVim.

### Project management

(Doom) Emacs has a great plugin called `projectile`: https://github.com/bbatsov/projectile. I use this very nice `Telescope` add-on as a replacement: https://github.com/nvim-telescope/telescope-project.nvim

## Text editing

I use a lot of plugins here, but notable ones are: [lexima.vim](https://github.com/cohama/lexima.vim) for auto-closing pairs and `endwise` functionality. It's the only one that works well with `nvim-compe` in my fiddling around.
[vim-sneak](https://github.com/justinmk/vim-sneak) is also awesome for moving quickly around text.
Honestly all the plugins I use for editing text efficiently have awesome README's, so I strongly advice to either check them out!

# Programming

Sadly I cannot make a living tweaking config files/ricing all day(_can I?_), using [lspconfig](https://github.com/neovim/nvim-lspconfig) removes all the headaches of connecting NeoVim with an LSP. Also use [nvim-metals](https://github.com/scalameta/nvim-metals) for Scala, it's great! 

Besides the LSP plugins, I also use general plugins for programming languages to get syntax highlighting, indentation and other stuff working. 

Treesitter and NeoVim also work well, but most programming languages I work in, don't have treesitter support just yet! Exciting stuff ahead though, because Treesitter is amazing: https://github.com/tree-sitter/tree-sitter.

Lastly I'm using [emmet-vim](https://github.com/mattn/emmet-vim) for easier HTML tag expanding.

# Themes.

I alternate between two themes:

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) by [@sainnhe](https://github.com/sainnhe)
- [Ayu Mirage](https://github.com/ayu-theme/ayu-vim).

Not much else to it, they are comfy themes. I use these [icons](https://github.com/kyazdani42/nvim-web-devicons) to make it prettier. I also use an indent guide and rainbow delimiter plugin, but I haven't delved in these much.

# Markdown

Currently, the only reason why I'm using VSCode still, is because I can't get markdown working in NeoVim _just right_. In VSCode I get YAML frontmatter highlighting, indentation(also in code blocks) and grammar checking working really easily, and with NeoVim some things are so-so. Also I wish there was something like [mixed-pitch-mode](https://gitlab.com/jabranham/mixed-pitch) for NeoVim.

# TODO

- Understand more of NeoVim's API.
- Theme switcher.
  - Telescope has a colorscheme picker, but you can't pick variations as far as I can tell.
- Make `emmet-vim` keybindings.
- Make NeoVim a more standard part in my git workflow
  - I want to have a better understanding of the Git CLI first.
- Connect [ltex-ls](https://github.com/valentjn/ltex-ls) with NeoVim's built-in LSP.
- I don't think I'm actually using [vista.vim](https://github.com/liuchengxu/vista.vim)? I just copied it from someone else's config, and I'm not sure what it does. It seems that `Telescope` can do everything `vista.vim` does?
- Prettify indent-guides.
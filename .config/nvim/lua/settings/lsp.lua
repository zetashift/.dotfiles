local M = {}

-- Most of this is from @ckipp01 dots
M.setup = function()
  local shared_diagnostic_settings =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })
  local lsp_config = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    handlers = {
      ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
    },
    capabilities = capabilities,
  })

  -- nvim-metals
  Metals_config = require("metals").bare_config
  Metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
    fallbackScalaVersion = "2.13.5",
  }

  Metals_config.init_options.statusBarProvider = "on"

  -- Lua
  lsp_config.sumneko_lua.setup({
    cmd = {
      "/home/rishi/bin/langservs/lua-language-server/bin/Linux/lua-language-server",
      "-E",
      "/home/rishi/bin/langservs/lua-language-server/main.lua",
    },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- since using mainly for neovim
          path = vim.split(package.path, ";"),
        },
        diagnostics = { globals = { "vim", "it" } },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    },
  })
  -- Nim
  lsp_config.nimls.setup({})

  -- Javascript
  lsp_config.tsserver.setup({})

  lsp_config.pyright.setup({})

  -- Nix
  lsp_config.rnix.setup({})
  -- Elixir
  lsp_config.elixirls.setup({
    cmd = { "/home/rishi/bin/langservs/elixirls/language_server.sh" },
  })
  -- Ltex-ls, for yelling grammar mistakes at me
  require'ltex_ls'.setup()
end

return M

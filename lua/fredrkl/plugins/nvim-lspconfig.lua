return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Adds LSP completion capabilities

    { "antosha417/nvim-lsp-file-operations", config = true }, -- Adds file rename lsp functionality

    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `config = {}` is the same as calling `require('fidget').setup({})`
    'j-hui/fidget.nvim',

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })
    require("fidget").setup({})

    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Configure servers
    ---- Bicep
    ----~ (cd $(mktemp -d) \
    ----~ && curl -fLO https://github.com/Azure/bicep/releases/latest/download/bicep-langserver.zip \
    ----~ && rm -rf /usr/local/bin/bicep-langserver \
    ----~ && unzip -d /usr/local/bin/bicep-langserver bicep-langserver.zip)
    local bicep_lsp_bin = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"
--    vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

    lspconfig["bicep"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "bicep" },
      cmd = { "dotnet", bicep_lsp_bin}
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "lua"},
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }, -- make lua-lsp aware of vim global
          }
        }
      }
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure Terraform language server
    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "terraform" },
    })
    
--    -- configure Rust analyser
--    lspconfig["rust_analyzer"].setup({
--      capabilities = capabilities,
--      on_attach = on_attach,
--      filetypes = { "rust" },
--      cmd = { "rustup", "run", "stable", "rust-analyzer" }
--    })

--    -- configure ltex language server
--    lspconfig["ltex-ls"].setup({
--      capabilities = capabilities,
--      on_attach = on_attach,
--      filetypes = { "markdown" },
--    })

    -- Configure servers
    ---- Omnisharp
    ----~ (cd $(mktemp -d) \
    ----~ && curl -fLO https://github.com/OmniSharp/omnisharp-roslyn/releases/latest/download/omnisharp-osx-arm64-net6.0.zip \
    ----~ && rm -rf /usr/local/bin/omnisharp \
    ----~ && unzip -d /usr/local/bin/omnisharp omnisharp-osx-arm64-net6.0.zip)
--    local omnisharp_lsp_bin = "/usr/local/bin/omnisharp/OmniSharp.dll"
--    vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

--    lspconfig["omnisharp"].setup({
--      capabilities = capabilities,
--      on_attach = on_attach,
--      cmd = { "dotnet", omnisharp_lsp_bin }
--    })

-- https://github.com/razzmatazz/csharp-language-server
-- This was a bit hacky. Did not work as excepted.
--Language Server for C#.
--csharp-ls requires the dotnet-sdk to be installed.
--The preferred way to install csharp-ls is with dotnet tool install --global csharp-ls
--
--lspconfig["csharp_ls"].setup({
--  capabilities = capabilities,
--  on_attach = on_attach,
--  filetypes = { "cs" },
--})
--
-- This does not work as lspconfig does not support the roslyn server.
--lspconfig["roslyn"].setup({
--    on_attach = function()
--        print("This will run when the server attaches!")
--    end,
--    settings = {
--        ["csharp|inlay_hints"] = {
--            csharp_enable_inlay_hints_for_implicit_object_creation = true,
--            csharp_enable_inlay_hints_for_implicit_variable_types = true,
--        },
--        ["csharp|code_lens"] = {
--            dotnet_enable_references_code_lens = true,
--        },
--    },
--})
--lspconfig["roslyn"].setup({
--  capabilities = capabilities,
--  on_attach = on_attach,
--  filetypes = { "cs" },
--})
  end,
}

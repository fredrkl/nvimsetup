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
      setup_global_keymaps(bufnr)

--      opts.buffer = bufnr
--
--      -- set keybinds
--      opts.desc = "Show LSP references"
--      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--      opts.desc = "Go to declaration"
--      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--      opts.desc = "Show LSP definitions"
--      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--      opts.desc = "Show LSP implementations"
--      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--      opts.desc = "Show LSP type definitions"
--      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--      opts.desc = "Show diagnostic messages"
--      keymap.set("n", "gd", vim.diagnostic.open_float, opts) -- show lsp type definitions
--
--      opts.desc = "Show all diagnostic messages"
--      keymap.set("n", "gad","<cmd>Telescope diagnostics<CR>", opts) -- show diagnostics definitions
--
--      opts.desc = "See available code actions"
--      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--      opts.desc = "Smart rename"
--      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--      opts.desc = "Show buffer diagnostics"
--      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--      opts.desc = "Go to previous diagnostic"
--      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--      opts.desc = "Go to next diagnostic"
--      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--      opts.desc = "Show documentation for what is under cursor"
--      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--      opts.desc = "Restart LSP"
--      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
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

    -- YAML Language Server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml" },
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheusrule_v1.json"] = "prometheusrules*.yaml",
          },
          validate = true, -- enable validation
          completion = true, -- enable completion
        },
      },
    })
  end,
}

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
     'mfussenegger/nvim-lint', -- nvim-lint for linters
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
    --local lspconfig = vim.lsp.config
    local vim = vim

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      setup_global_keymaps(bufnr)

      local cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
          max_height = 12,
          max_width = 80,
        }
      }

      require "lsp_signature".on_attach(cfg, bufnr)
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

    vim.lsp.config("bicep",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "bicep" },
      cmd = { "dotnet", bicep_lsp_bin}
    })
    vim.lsp.enable("bicep")

    vim.lsp.config("lua_ls",{
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
    vim.lsp.enable("lua_ls")

    -- configure emmet language server
    vim.lsp.config("emmet_ls",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
    vim.lsp.enable("emmet_ls")

    -- configure Terraform language server
    vim.lsp.config("terraformls",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "terraform" },
    })
    vim.lsp.enable("terraformls")

    -- YAML Language Server
    vim.lsp.config("yamlls",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml" },
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheusrule_v1.json"] = "prometheusrules*.yaml",
            ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/alertmanager_v1.json"] = "alertmanager*.yaml",
            ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/alertmanagerconfig_v1alpha1.json"] = "alertconfig*.yaml",
          },
          validate = true, -- enable validation
          completion = true, -- enable completion
        },
      },
    })
    vim.lsp.enable("yamlls")

    vim.lsp.config("marksman",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "markdown" },
    })
    vim.lsp.enable("marksman")

    -- Setup nvim-lint for linters
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = { "luacheck" },       -- example: Lua linter
      markdown = { "markdownlint-cli2" }, -- add markdown linter
      yaml = { "yamllint" }, -- add yaml linter
      -- Add more filetypes and linters as needed
    }

    -- Optionally, run lint on BufWritePost
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

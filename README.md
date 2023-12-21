# My Neovim setup

## Requirements

- [Nerdfonts](https://www.nerdfonts.com/font-downloads)
- [Dotnet sdk](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks)

## Setup

- Install neovim
- Install Nerdfonts
- Run `:checkhealth lazy` for `lazy vim` plugin verification

## Sources

- [Primeagen guide](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [Josean Martinez guide](https://www.youtube.com/watch?v=6mxWayq-s9I)

## Language Server Protocol (LSP) - setup

## Mason

This plugin uses the Mason plugin to manage LSPs. See the mason github repo for [available Mason LSP servers](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers).

## Bicep

The LSP for Bicep need `dotnet cli` to run, and is started with the `cmd` property.  Please see the `nvim-lspconfig.lua` for more information.

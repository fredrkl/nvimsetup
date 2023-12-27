# My Neovim setup

## Requirements

- [Nerdfonts](https://www.nerdfonts.com/font-downloads)
- [Dotnet sdk](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks)
- [Nodejs](https://nodejs.org/en/download/)

Nodejs is only needed for [_GitHub Copilot_](https://github.com/features/copilot). Dotnet sdk is only needed for the _Bicep_ LSP.

## Setup

- Install neovim
- Install Nerdfonts
- Fork this repo and clone it to your `~/.config/` folder
- Start _NeoVim_
- Run `:checkhealth lazy` for `lazy vim` plugin verification
- Verify plugins by running the `Lazy` command

## Sources

- [Primeagen guide](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [Josean Martinez guide](https://www.youtube.com/watch?v=6mxWayq-s9I)

## Mason Language Server Protocol (LSP) plugin manager

This plugin uses the Mason plugin to manage LSPs. See the mason github repo for [available Mason LSP servers](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers).

### Bicep Language Server Protocol (LSP)

The LSP for Bicep need `dotnet cli` to run, and is started with the `cmd` property.  Please see the [`nvim-lspconfig.lua`](./lua/fredrkl/plugins/nvim-lspconfig.lua) and the [official `lsp config`](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bicep.lua) for more information.

## GitHub Copilot

GitHub Copilot is a plugin that uses AI to help you write code. To use it, you need to have a GitHub account and be logged in to GitHub in your browser. See the neovim copliot plugin [repo](https://github.com/zbirenbaum/copilot.lua) for more information, e.g., default keybindings. The copliot plugin uses the _meta key_ by default, however that has been remapped in this settup to avoid _meta key_ usage. See the [plugin setup](./lua/fredrkl/plugins/zbirenbaum-copilot.lua) for the new keybindings.

If using iTerm2 on macOS, the _meta key_ is not enabled by default. To enable it, go to `Preferences > Profiles > Keys` and select `Left option key acts as +Esc`.

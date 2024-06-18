# My Lovely Configuration for Go and .NET Development

This repository contains a LunarVim configuration tailored for Go & .NET development, including syntax highlighting, linting, formatting, debugging, and more. Follow the instructions below to set up your environment.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
  - [Treesitter](#treesitter)
  - [Plugins](#plugins)
  - [Formatting](#formatting)
  - [Linting](#linting)
  - [DAP (Debug Adapter Protocol)](#dap-debug-adapter-protocol)
  - [LSP (Language Server Protocol)](#lsp-language-server-protocol)
  - [ToggleTerm](#toggleterm)
- [Key Mappings](#key-mappings)
- [Footer](#footer)

## Installation

1. **Install LunarVim**: Follow the [official installation guide](https://www.lunarvim.org/docs/installation).

2. **Clone this repository**:
    ```sh
    git clone https://github.com/acephasanudin/lunarvim-config.git ~/.config/lvim

3. **Restart LunarVim** to apply the configuration.

## Configuration

### Treesitter

Ensure Go and Go module files are highlighted correctly.

### Plugins

Additional plugins to enhance Go development.

### Formatting

Configure formatters to automatically format Go files on save.

### Linting

Configure linters for Go files.

### DAP (Debug Adapter Protocol)

Set up DAP for debugging Go & .NET applications with `nvim-dap` and `nvim-dap-ui`.

### LSP (Language Server Protocol)

Set up Go language servers and additional commands.

### ToggleTerm

Configure ToggleTerm for terminal management within LunarVim.

## Key Mappings

### Normal Mode Key Mappings

- `<F5>`: Continue
- `<F10>`: Step Over
- `<F11>`: Step Into
- `<F12>`: Step Out

### Leader Key Mappings

- `<Leader>n`: Toggle Breakpoint
- `<Leader>N`: Set Conditional Breakpoint
- `<Leader>lp`: Set Log Point
- `<Leader>dr`: Open REPL
- `<Leader>dl`: Run Last

## Footer

Custom footer for the LunarVim dashboard.

---

For more details and advanced configuration, refer to the LunarVim [documentation](https://www.lunarvim.org/docs).




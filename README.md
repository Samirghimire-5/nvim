# My Neovim Config

A fully featured Neovim configuration with **LSP, autocompletion, snippets, Treesitter, Neo-tree file explorer, Telescope, and autopairs** with LSP servers for **JavaScript/TypeScript, Python, Lua, HTML/CSS**, and linters/formatters like **ESLint, Ruff, Prettier, and Black**.

---

## Features

- **LSP Support** via `nvim-lspconfig` and `mason.nvim`
  - Lua, TypeScript, Python, HTML, CSS
- **Autocompletion** using `nvim-cmp` + `LuaSnip`
- **Snippets** with `friendly-snippets` (predefined snippets for many languages)
- **Auto pairs & brackets** with `nvim-autopairs`
- **Neo-tree** for file navigation (VS Code-like)
- **Treesitter** for syntax highlighting & code navigation
- **Telescope** for fuzzy search and UI selection
- **Git integration** in Neo-tree

---

## Requirements

- Neovim >= 0.12
- Git
- Node.js (for JS/TS LSP)
- Python (for Pyright and linters)
- Optional: `ripgrep` for Telescope

---

## Installation

**1. Backup existing Neovim config (if any):**

```bash
mv ~/.config/nvim ~/.config/nvim.bak

```

**2. Clone this repository:**
```bash
git clone https://github.com/Samirghimire-5/nvim.git ~/.config/nvim
```

**3. Open Neovim:**
```bash
nvim
```
Lazy.nvim will automatically install all plugins on first startup.

---


# Keybindings
**`<leader>e`**	Toggle Neo-tree file explorer\
**`<leader>ft`**	Focus Neo-tree\
**`<leader>bf`**	Show buffer list\
**`<leader>gs`**	Show Git status\
**`gd`**	Go to definition (LSP)\
**`K`**	Hover documentation (LSP)\
**`<leader>ca`**	Code action (LSP)\
**`<Tab>`**	Expand snippet / select next completion item\
**`<S-Tab>`**	Jump to previous snippet position\
**`jk`** Exit insert or visual mode (<Esc>)\
**`jk`** Exit terminal mode\

**`haven't mentioned all the keybindings here, you can see all keybindings after cloning this config,
inside config type :map this will list all of the keymaps including in which the keymaps are located.`**

---

# Plugins Included

- **Completion & Snippets**

  - hrsh7th/nvim-cmp

  - hrsh7th/cmp-nvim-lsp

  - L3MON4D3/LuaSnip

  - saadparwaiz1/cmp_luasnip

  - rafamadriz/friendly-snippets

  - windwp/nvim-autopairs

- **LSP & Mason**

  - neovim/nvim-lspconfig

  - mason-org/mason.nvim

  - mason-org/mason-lspconfig.nvim

  - none-ls.nvim

  - none-ls-extras.nvim

- **File Explorer & UI**

  - nvim-neo-tree/neo-tree.nvim

  - nvim-tree/nvim-web-devicons

  - nui.nvim

- **Treesitter & Syntax**

  - nvim-treesitter/nvim-treesitter

- **Telescope**

  - telescope.nvim

  - telescope-ui-select.nvim

- **Utilities**

  - gitsigns.nvim

  - plenary.nvim

  - alpha-nvim

  - lualine.nvim

  - lazy.nvim

---

# Contributing

Feel free to fork and customize!\
Open an issue or PR if you want to contribute or report bugs.

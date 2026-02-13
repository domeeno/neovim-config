# Neovim Configuration

A modern Neovim configuration with LSP support, plugin management via lazy.nvim, and comprehensive tooling for various programming languages.

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin management
- **LSP Support**: Full Language Server Protocol integration with Mason for easy LSP server management
- **Autocompletion**: Intelligent code completion with nvim-cmp
- **Syntax Highlighting**: Enhanced syntax highlighting with Treesitter
- **Git Integration**: Git operations with fugitive and gitsigns
- **File Explorer**: Neo-tree for intuitive file navigation
- **Fuzzy Finding**: Telescope for powerful file and text searching
- **Terminal Integration**: Integrated terminal with toggleterm
- **Themes**: Multiple color schemes available

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for proper icon display (optional but recommended)
- Node.js (for some LSP servers)
- Python 3 (for Python-based tools)
- Go (for Go-based tools)

### Steps

1. **Backup your existing Neovim configuration** (if you have one):

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

2. **Clone this repository**:

```bash
git clone https://github.com/domeeno/neovim-config.git ~/.config/nvim
```

3. **Start Neovim**:

```bash
nvim
```

On first launch, lazy.nvim will automatically:
- Install itself
- Download and install all configured plugins
- Set up Mason and install LSP servers

This initial setup may take a few minutes. Wait for all installations to complete.

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Entry point - loads all modules
├── lua/
│   ├── setup/           # Core Neovim configuration
│   │   ├── global.lua   # Global variables
│   │   ├── options.lua  # Vim options (line numbers, tabs, etc.)
│   │   ├── keymaps.lua  # Custom keybindings
│   │   └── autocmds.lua # Autocommands
│   ├── lazy/
│   │   └── setup.lua    # Lazy.nvim configuration
│   └── plugins/         # Plugin specifications
│       ├── LSP.lua      # LSP and Mason configuration
│       ├── treesitter.lua
│       ├── telescope.lua
│       └── ...
```

## Lazy.nvim Workflow

### What is lazy.nvim?

[lazy.nvim](https://github.com/folke/lazy.nvim) is a modern plugin manager for Neovim that features:
- Lazy loading of plugins for faster startup
- Automatic plugin updates
- Clean and declarative plugin specification
- Built-in UI for managing plugins

### Plugin Management

**Open the lazy.nvim UI:**
```vim
:Lazy
```

From the lazy.nvim UI, you can:
- **Update plugins**: Press `U`
- **Sync plugins**: Press `S` (install missing, update, and clean)
- **Clean unused plugins**: Press `X`
- **View plugin details**: Navigate to a plugin and press `Enter`
- **Check for updates**: Press `C`

### Adding New Plugins

1. Create a new file in `lua/plugins/` or edit an existing one
2. Add your plugin specification:

```lua
return {
  {
    "author/plugin-name",
    config = function()
      -- Plugin configuration here
    end,
  },
}
```

3. Restart Neovim or run `:Lazy sync`

### Plugin Configuration Format

Plugins are specified using a declarative syntax:

```lua
return {
  {
    "plugin/name",
    dependencies = { "required/plugin" },  -- Dependencies
    lazy = true,                            -- Lazy load
    event = "BufRead",                      -- Load on event
    cmd = "CommandName",                    -- Load on command
    keys = { "<leader>x" },                -- Load on keymap
    config = function()
      -- Setup code
    end,
  },
}
```

## LSP and Mason Workflow

### What is Mason?

[Mason](https://github.com/williamboman/mason.nvim) is a portable package manager for Neovim that allows easy installation and management of LSP servers, linters, formatters, and other tools.

### Opening Mason

Press `<leader>m` (by default, leader is `\`, so `\m`) or run:

```vim
:Mason
```

### Managing LSP Servers

In the Mason UI:
- **Navigate**: Use `j`/`k` or arrow keys
- **Install**: Press `i` on a package
- **Uninstall**: Press `X` on an installed package
- **Update**: Press `u` on an installed package
- **Update all**: Press `U`

### Pre-configured LSP Servers

This configuration automatically installs the following LSP servers:

- **Python**: `pyright`, `ruff`
- **Go**: `gopls`
- **Bash**: `bashls`
- **Lua**: `lua_ls`
- **Starlark**: `starpls`
- **Quality**: `sonarlint`

### Pre-configured Tools

Additional tools are automatically installed:

**Python Tools:**
- black, autopep8 (formatters)
- flake8, pylint, mypy (linters)
- bandit (security)

**Go Tools:**
- staticcheck (linter)
- go-debug-adapter (debugger)

**Shell Tools:**
- shellcheck (linter)
- beautysh (formatter)

**Lua Tools:**
- stylua (formatter)

### LSP Keybindings

This configuration includes the following LSP keybindings:

- `<F2>` - Rename symbol
- `<F3>` - Format document
- `<F4>` - Code actions
- `gd` - Go to definition (requires additional setup)
- `gr` - Show references (requires additional setup)
- `K` - Show hover documentation (requires additional setup)

### Adding a New LSP Server

1. Open Mason with `<leader>m`
2. Search for your desired LSP server
3. Press `i` to install it
4. The LSP server will be automatically configured via `mason-lspconfig`

For custom configuration, edit `lua/plugins/LSP.lua` and add the server to the `ensure_installed` list.

## Key Bindings

The leader key is set to `\` by default.

Common keybindings:
- `<leader>m` - Open Mason
- `<leader>e` - Toggle Neo-tree file explorer
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>gs` - Git status

See `lua/setup/keymaps.lua` and individual plugin configurations for complete keybinding documentation.

## Customization

### Changing Options

Edit `lua/setup/options.lua` to modify Neovim settings like line numbers, tabs, scrolling behavior, etc.

### Adding Keybindings

Add custom keybindings in `lua/setup/keymaps.lua`.

### Plugin Configuration

Each plugin has its own file in `lua/plugins/`. Modify these files to customize plugin behavior.

## Troubleshooting

### Plugins not loading

1. Run `:Lazy sync` to ensure all plugins are installed
2. Check `:checkhealth` for issues
3. Restart Neovim

### LSP not working

1. Open Mason with `<leader>m`
2. Verify the LSP server is installed
3. Run `:LspInfo` to check server status
4. Run `:checkhealth lsp` for diagnostics

### Fresh Start

If you encounter persistent issues:

```bash
# Backup first
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

Then restart Neovim to trigger a fresh installation.

## Contributing

Feel free to open issues or submit pull requests for improvements!

## License

This configuration is provided as-is for personal use.

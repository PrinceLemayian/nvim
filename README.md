# nvim

My personal Neovim configuration built on [LazyVim](https://lazyvim.org), optimized for a Windows 11 development workflow. Covers web development, Solidity/blockchain, Rust, and C.

## Requirements

- [Neovim](https://neovim.io/) >= 0.9.0
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) — icons will break without one
- [Node.js](https://nodejs.org/) — required by several LSP servers
- [ripgrep](https://github.com/BurntSushi/ripgrep) — for Telescope live grep
- [LazyGit](https://github.com/jesseduffield/lazygit) — for the lazygit plugin (see Windows note below)

## Installation

### Windows (primary)

Back up any existing config first:

```powershell
Move-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.bak"
Move-Item "$env:LOCALAPPDATA\nvim-data" "$env:LOCALAPPDATA\nvim-data.bak"
```

Then clone and launch:

```powershell
git clone https://github.com/PrinceLemayian/nvim.git "$env:LOCALAPPDATA\nvim"
nvim
```

Lazy will bootstrap itself and install all plugins on the first launch. Plugin versions are pinned by `lazy-lock.json`, so you get the exact same setup.

### Linux / macOS

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/PrinceLemayian/nvim.git ~/.config/nvim
nvim
```

> Some paths and keymaps are tuned for Windows. Check `lua/config/keymaps.lua` for anything that might need adjusting on other platforms.

## Plugin Overview

| Plugin                                                             | Purpose                               |
| ------------------------------------------------------------------ | ------------------------------------- |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)          | Colorscheme                           |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)  | Animated cursor movement              |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)           | Full LazyGit UI inside Neovim         |
| [project.nvim](https://github.com/ahmedkhalf/project.nvim)         | Auto project root detection           |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)         | LSP client configuration              |
| [conform.nvim](https://github.com/stevearc/conform.nvim)           | Code formatting                       |
| [vim-wakatime](https://github.com/wakatime/vim-wakatime)           | Coding activity tracking              |

All other plugins come from the LazyVim base distribution. See [lazyvim.org/plugins](https://www.lazyvim.org/plugins) for the full list.

## Custom Keymaps

> See `lua/config/keymaps.lua` for the full list.

| Keymap       | Mode           | Description                                                       |
| ------------ | -------------- | ----------------------------------------------------------------- |
| `<leader>r`  | Normal         | Compile & run current C file via `gcc` in a bottom split terminal |
| `<leader>gg` | Normal         | Open LazyGit                                                      |
| `<leader>fp` | Normal         | Find projects (Telescope)                                         |
| `<leader>y`  | Normal, Visual | Yank to system clipboard                                          |
| `<leader>yy` | Normal         | Yank entire line to system clipboard                              |
| `<leader>p`  | Normal         | Paste from system clipboard                                       |
| `<leader>p`  | Visual         | Paste over selection without overwriting clipboard                |
| `jj`         | Terminal       | Escape terminal mode (`<C-\><C-n>`)                               |

## Code Style

Lua files are formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua). Config lives in `stylua.toml` at the repo root.

To format manually:

```bash
stylua lua/
```

## Windows-Specific Notes

**LazyGit** — installed via [Scoop](https://scoop.sh). The PATH is set explicitly in `keymaps.lua` pointing to `C:/Users/<you>/Scoop/shims/lazygit.exe`. On a new machine, install Scoop first, then run `scoop install lazygit`, and update the username in that PATH line.

**Windows Terminal shortcuts** — some LazyVim default keymaps (e.g. `<C-\>`) are intercepted by Windows Terminal before reaching Neovim. If a keymap isn't firing, check your Windows Terminal key binding settings and remove or remap the conflict there.

**WakaTime API key** — stored at `C:\Users\<you>\.wakatime.cfg`, never in this repo. On a new machine, run `nvim` once; WakaTime will prompt you to enter your key. Get it from [wakatime.com/settings/api-key](https://wakatime.com/settings/api-key).

## Updating

To update plugins to their latest versions:

```
:Lazy update
```

Then commit the updated lockfile:

```bash
git add lazy-lock.json
git commit -m "chore(lockfile): update plugins"
```

To sync to the exact pinned versions from the lockfile (e.g. after cloning on a new machine):

```
:Lazy restore
```

## Structure

```
nvim/
├── init.lua               # Entry point — bootstraps LazyVim
├── lazy-lock.json         # Pinned plugin versions
├── lazyvim.json           # Enabled LazyVim extras
├── stylua.toml            # Lua formatter config
└── lua/
    ├── config/
    │   ├── autocmds.lua   # Custom autocommands
    │   ├── keymaps.lua    # Custom keymaps
    │   ├── lazy.lua       # Lazy.nvim setup
    │   └── options.lua    # Vim options
    └── plugins/
        ├── formatting.lua
        ├── kanagawa.lua
        ├── lazygit.lua
        ├── lsp.lua
        ├── project.lua
        ├── smear_cursor.lua
        ├── telescope.lua
        └── wakatime.lua
```

## Acknowledgements

Built on [LazyVim](https://lazyvim.org) by [@folke](https://github.com/folke).

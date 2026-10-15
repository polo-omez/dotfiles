# Dotfiles

A modular, Gruvbox-themed Wayland desktop environment setup built around **Hyprland**, featuring a complete suite of CLI tools, GUI applications, custom scripts, and consistent styling across GTK and Qt.

---

## Theme 

- **Color Palette:** [Gruvbox Material](https://github.com/sainnhe/gruvbox-material) 
- **Toolkit Integration:**
  - **GTK 3 / 4:** `Gruvbox-Material-Dark-HIDPI` via `nwg-look`.
  - **Qt 5 / 6:** Unified with `qt5ct`, `qt6ct`, and `Kvantum` (`gruvbox-kvantum`).

---

## Desktop & Window Management

| Component | Tool | Description |
| :--- | :--- | :--- |
| **Compositor** | [Hyprland](https://hyprland.org/) | Modular Lua/conf setup (`appearance`, `animations`, `keybinds`, `rules`, `monitors`, `autostart`) |
| **Bar** | [Waybar](https://github.com/Alexays/Waybar) | Top/bottom status bar integrated with audio, cava, workspace indicators, and system monitors |
| **Lock / Idle** | `hyprlock` & `hypridle` | Secure lock screen and power management |
| **Wallpaper** | `hyprpaper` | Minimalist wallpaper daemon |
| **Launchers** | [Rofi](https://github.com/davatorium/rofi) / [Wofi](https://hg.sr.ht/~scoopta/wofi) | App launcher, web search, and custom power menu |
| **Session Menu** | `wlogout` | Quick logout, restart, suspend, and shutdown dashboard |

---

##  Terminal & Shell

- **Shell:** `Zsh` powered by [Oh My Zsh](https://ohmyz.sh/) with syntax highlighting, autosuggestions, and custom key bindings.
- **Terminals:** [Kitty](https://sw.kovidgoyal.net/kitty/) (primary) and [Alacritty](https://alacritty.org/) (fallback / alternative).
- **Multiplexer:** [tmux](https://github.com/tmux/tmux) with vim-navigation keybindings.
- **CLI Utilities:**
  - `fastfetch` for minimal system information display.
  - `btop` for resource monitoring.
  - `cava` for real-time audio visualization (with custom shaders and Waybar integration).
  - `yazi` for fast terminal file browsing.

---

##  Editor & Development

- **Neovim (`nvim`):** Modular configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim):
  - **LSP & Tooling:** `nvim-lspconfig`, formatters (`conform` / `autoformat`), and linters.
  - **Java:** Dedicated `jdtls` configuration (`ftplugin/java.lua`).
  - **Navigation & UI:** `telescope.nvim`, `neo-tree.nvim`, `bufferline.nvim`, `dashboard-nvim`, and `treesitter`.
  - **Workflow:** `vim-tmux-navigator`, `flash.nvim`, `vim-test`, and `yazi.nvim` integration.

---

##  Repository Structure

```text
dotfiles-main/
├── alacritty/       # Alacritty terminal configuration
├── btop/            # btop monitor settings
├── cava/            # Audio visualizer configs, shaders, and themes
├── fastfetch/       # Fastfetch hardware/OS fetch configuration
├── fontconfig/      # Font rendering and fallback rules
├── gtk/             # GTK 3 & GTK 4 themes and bookmarks
├── hypr/            # Hyprland ecosystem (hyprland, hyprlock, hypridle, hyprpaper)
├── kitty/           # Kitty terminal configuration & color profiles
├── kvantum/         # Gruvbox theme for Kvantum (Qt)
├── mpv/             # mpv video player configuration
├── nvim/            # Lua-based Neovim configuration
├── nwg-look/        # GTK settings manager configuration
├── oh_my_zsh/       # Bundled Oh My Zsh plugins and themes
├── qt5ct/ & qt6ct/  # Qt styling configurations
├── quickshell/      # Overview panel configuration
├── qview/           # Lightweight image viewer preferences
├── rofi/ & wofi/    # Application menus and session pickers
├── scripts/         # Custom bash scripts (volume, brightness, toggles, backups)
├── system/          # Custom XKB symbols and mime defaults
├── thunar/          # Thunar file manager actions and accelerators
├── tmux/            # tmux layout and keybindings
├── waybar/          # Waybar JSON and CSS styles
├── wlogout/         # Logout overlay configuration and icons
├── yazi/            # Yazi file manager keymaps and themes
└── zsh/             # Main .zshrc configuration
```

---


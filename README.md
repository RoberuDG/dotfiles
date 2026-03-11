# 🖼️ EVA Unit-01 Dotfiles

i3WM configuration with **video wallpaper support** for X11.

## ✨ Features

- 🎬 **Video Wallpapers** - MP4/WebM animated wallpapers on X11
- 🎨 **Color Extraction** - hellwal + matugen integration
- 🔒 **Blurred Lock Screen** - Multi-monitor support
- ⚡ **Optimized Performance** - picom with use-damage=false
- 🖥️ **Multi-monitor** - Automatic per-screen wallpapers
- 📊 **System Monitoring** - Bottom/btop with EVA Unit-01 theme
- 💻 **Terminal Multiplexer** - Zellij with NERV Command Center layout

## 📦 Installation

```bash
# Clone dotfiles
git clone git@github.com:RoberuDG/dotfiles.git ~/.config/dotfiles

# Install i3 config
ln -sf ~/.config/dotfiles/i3/config ~/.config/i3/config

# Install picom config
ln -sf ~/.config/dotfiles/picom/picom-optimized.conf ~/.config/picom/picom.conf

# Install scripts
ln -sf ~/.config/dotfiles/scripts/* ~/.config/i3/scripts/

# Install bottom config (EVA Unit-01 theme)
ln -sf ~/.config/dotfiles/bottom/bottom.toml ~/.config/bottom/bottom.toml

# Install zellij config (NERV Command Center)
ln -sf ~/.config/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
```

## 🎬 Video Wallpaper Setup

```bash
# Install dependencies
sudo pacman -S xwinwrap mpv ffmpeg

# Convert videos to 1080p (optional, better performance)
~/Pictures/Wallpapers/EVA/convert-to-1080p.sh

# Set video wallpaper
~/.config/i3/scripts/video-wallpaper --next

# With color extraction
~/.config/i3/scripts/video-wallpaper --next-colors
```

## 🎨 Color Palette

Extract colors from wallpapers and apply to i3:

```bash
# Install color tools
~/.config/i3/scripts/install-color-tools

# Apply to i3 theme
~/.config/i3/scripts/apply-wallpaper-colors-i3
```

## ⌨️ Keybindings

| Key | Action |
|-----|--------|
| `$mod+F9` | Next video wallpaper |
| `$mod+Alt+F9` | Video + apply colors |
| `$mod+Alt+F10` | Apply colors to i3 |
| `$mod+Control+F9` | Stop wallpapers |
| `$mod+l` | Lock screen (blurred) |

## 📁 Structure

```
dotfiles/
├── i3/
│   ├── config              # Main i3 config
│   └── scripts/            # i3 scripts
├── picom/
│   ├── picom.conf          # Standard config
│   └── picom-optimized.conf # Video-optimized
├── scripts/
│   ├── video-wallpaper     # Main video wallpaper script
│   ├── wallpaper-colors    # Color extraction
│   └── convert-to-1080p.sh # Video converter
├── bottom/
│   └── bottom.toml         # EVA Unit-01 themed system monitor
├── zellij/
│   ├── config.kdl          # NERV Command Center config
│   ├── themes/
│   │   └── nerv-terminal.kdl  # Cyberpunk Solarized theme
│   └── layouts/
│       └── nerv-command.kdl   # High-density multi-pane layout
├── starship.toml           # Prompt config
└── README.md
```

## 🚀 Performance

- Videos converted to 1080p (4K → 1080p = 4x less CPU)
- Hardware decoding enabled (`--hwdec=auto`)
- Picom `use-damage=false` for video performance
- mpv threads reduced (`--vd-lavc-threads=2`)

## 🛠️ Requirements

```bash
# Core
i3-gaps picom xwinwrap mpv ffmpeg

# Color extraction (optional)
hellwal matugen

# Lock screen
i3lock scrot imagemagick

# System monitoring (bottom/btop)
bottom btop htop

# Terminal multiplexer
zellij

# Dev tools (optional, for NERV Command Center)
lazygit lazydocker ncdu lf ranger
```

## 📊 Bottom - EVA Unit-01 Theme

High-density system monitor with EVA Unit-01 color scheme (purple/green/teal).

```bash
# Launch bottom
btm

# Features:
# - 500ms refresh rate for dynamic display
# - 5-minute time window with 30-minute retention
# - GPU monitoring enabled
# - All process columns visible
# - Braille markers for high-resolution graphs
# - 16-color CPU core gradient
```

**Color Palette** (distinct from zellij):
- Primary: Purple `#8A33FF`
- Secondary: Green `#44FF88`
- Accent: Teal `#00FFFF`
- Background: Dark `#0D0B14`

## 💻 Zellij - NERV Command Center

High-density terminal multiplexer with cyberpunk solarized theme (cyan/amber/navy).

```bash
# Launch zellij with NERV layout
zellij

# Or specify layout explicitly
zellij --layout nerv-command

# Keybinds (Session mode - Ctrl+o):
# Ctrl+o m → bottom
# Ctrl+o t → lazygit
# Ctrl+o n → ncdu
# Ctrl+o l → lazydocker
# Ctrl+o v → nvim

# Alt keybinds:
# Alt+t → bottom
# Alt+g → lazygit
# Alt+d → ncdu
# Alt+w → btm

# Layout tabs:
# ⚡ Command - 8-pane system monitoring hub
# 💻 Dev - 6-pane development workspace
# 📊 Monitor - Full-screen btop
# 📁 Files - File manager + directory tree
```

**Color Palette** (distinct from bottom):
- Primary: Cyan `#2AA198`
- Secondary: Teal `#26A69A`
- Accent: Orange `#CB7516`
- Background: Navy `#0F172A`

**Features:**
- 50,000 line scrollback buffer
- 5-second serialization interval
- Advanced mouse actions enabled
- Styled underlines for visual hierarchy
- Live system stats in multiple panes

# 🖼️ EVA Unit-01 Dotfiles

i3WM configuration with **video wallpaper support** for X11.

## ✨ Features

- 🎬 **Video Wallpapers** - MP4/WebM animated wallpapers on X11
- 🎨 **Color Extraction** - hellwal + matugen integration
- 🔒 **Blurred Lock Screen** - Multi-monitor support
- ⚡ **Optimized Performance** - picom with use-damage=false
- 🖥️ **Multi-monitor** - Automatic per-screen wallpapers

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
```

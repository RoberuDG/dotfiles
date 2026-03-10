# 🖼️ EVA Unit-01 Video Wallpaper System

## Features
- ✅ Multi-monitor support (different video per screen)
- ✅ Automatic resolution scaling
- ✅ **Combined hellwal + matugen** color extraction
- ✅ Material You color schemes
- ✅ Hotplug support (laptop + dock scenarios)

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                   Video Wallpaper System                     │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────────┐      ┌──────────────┐                     │
│  │  xwinwrap    │      │   mpv        │                     │
│  │  (display)   │─────▶│  (playback)  │                     │
│  └──────────────┘      └──────────────┘                     │
│                                                              │
│  ┌──────────────────────────────────────────────┐           │
│  │         Color Extraction Pipeline            │           │
│  ├──────────────────────────────────────────────┤           │
│  │                                               │           │
│  │  Video ──▶ ffmpeg ──▶ Frame Image            │           │
│  │                                               │           │
│  │           ┌──────────────┐                   │           │
│  │           │  hellwal     │──▶ Terminal       │           │
│  │           │  (fast)      │──▶ GTK basic      │           │
│  │           └──────────────┘                   │           │
│  │                                               │           │
│  │           ┌──────────────┐                   │           │
│  │           │  matugen     │──▶ Material You   │           │
│  │           │  (schemes)   │──▶ GTK theme      │           │
│  │           │              │──▶ Qt apps        │           │
│  │           │              │──▶ Waybar         │           │
│  │           └──────────────┘                   │           │
│  │                                               │           │
│  └──────────────────────────────────────────────┘           │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

## Installation

### 1. Install Color Tools (hellwal + matugen)

```bash
~/.config/i3/scripts/install-color-tools
```

This installs:
- **hellwal** (pip) - Fast color extraction
- **matugen** (AUR/cargo) - Material You schemes

### Requirements
- `ffmpeg` - Video frame extraction
- `python3-pip` - For hellwal
- `yay` or `paru` or `cargo` - For matugen

## Keybindings

| Keybinding | Action |
|------------|--------|
| `$mod+F9` | Next random video (different per monitor) |
| `$mod+Shift+F9` | Select video (same on all monitors) |
| `$mod+Control+F9` | Stop all video wallpapers |
| `$mod+Alt+F9` | **Next video + auto-apply colors** |
| `$mod+Alt+Shift+F9` | Re-apply colors from current wallpaper |

> **Note:** Using F9 to avoid conflict with keyboard layout toggle on F6

## Usage

### Quick Start

```bash
# Install tools
~/.config/i3/scripts/install-color-tools

# Set wallpaper with colors (recommended)
$mod+Alt+F9

# Or manually
~/.config/i3/scripts/video-wallpaper --next-colors
```

### Color Commands

```bash
# Apply colors from current wallpaper
~/.config/i3/scripts/wallpaper-colors -c

# Apply with specific Material You scheme
~/.config/i3/scripts/wallpaper-colors -c vibrant
~/.config/i3/scripts/wallpaper-colors -c neutral
~/.config/i3/scripts/wallpaper-colors -c monochrome

# Show current colors
~/.config/i3/scripts/wallpaper-colors -s

# Reload color configs
~/.config/i3/scripts/wallpaper-colors -r
```

### Wallpaper Commands

```bash
# Random videos on all monitors
~/.config/i3/scripts/video-wallpaper --next

# Same video on all monitors
~/.config/i3/scripts/video-wallpaper --same

# With auto colors
~/.config/i3/scripts/video-wallpaper --next-colors
~/.config/i3/scripts/video-wallpaper --colors

# Stop all
~/.config/i3/scripts/video-wallpaper --stop
```

## Color Schemes

Matugen provides different Material You color schemes:

| Scheme | Description |
|--------|-------------|
| `vibrant` | Rich, saturated colors |
| `colorful` | Balanced, diverse palette |
| `neutral` | Muted, professional tones |
| `tonal` | Harmonious tonal variations |
| `expressive` | Bold, dramatic colors |
| `monochrome` | Single hue variations |

## What Gets Colored

### hellwal applies to:
- Terminal (background, foreground, 16 colors)
- Basic GTK theming
- Pywal-compatible apps

### matugen applies to:
- GTK 3.0 apps (GNOME, GTK apps)
- Qt 5 apps (via qt5ct)
- Waybar status bar
- Any app reading Xresources

## Laptop + External Monitor

The script auto-detects connected monitors:

| Scenario | Behavior |
|----------|----------|
| Laptop only (1 screen) | 1 video wallpaper |
| + 1 external (2 screens) | 2 different videos |
| + 2 externals (3 screens) | 3 different videos |
| Unplug external | Run script again → 1 video |
| Plug in external | Run script again → multi-video |

**Tip:** Add a keybinding to quickly restore after docking:
```bash
# In ~/.config/i3/config
bindsym XF86DisplayMode exec --no-startup-id ~/.config/i3/scripts/video-wallpaper --next
```

## File Structure

```
~/.config/i3/scripts/
├── video-wallpaper          # Main wallpaper script
├── wallpaper-colors         # Color extraction (hellwal + matugen)
├── install-color-tools      # Installer
└── README-WALLPAPER.md      # This file

~/.config/matugen/
├── config.toml              # Main config
└── templates/
    ├── shell.hbs            # Shell color exports
    ├── gtk.css.hbs          # GTK theme
    └── qt.conf.hbs          # Qt theme

~/.cache/
├── wallpaper-thumbnails/    # Extracted video frames
├── wallpaper-colors/        # Generated color palettes
└── wal/                     # hellwal colors
```

## Troubleshooting

### Videos not showing
```bash
# Check processes
ps aux | grep -E "xwinwrap|mpv"

# Restart
~/.config/i3/scripts/video-wallpaper --stop
~/.config/i3/scripts/video-wallpaper --next
```

### Colors not applying
```bash
# Check tools installed
~/.config/i3/scripts/install-color-tools

# Verify
command -v hellwal matugen ffmpeg
```

### Wrong colors
```bash
# Try different scheme
~/.config/i3/scripts/wallpaper-colors -c neutral

# Or monochrome for subtle
~/.config/i3/scripts/wallpaper-colors -c monochrome
```

### Performance issues
- Use lower resolution videos (1080p vs 4K)
- MP4/WebM more efficient than GIF
- Videos are GPU-accelerated via mpv

## Examples

### Purple EVA theme from wallpaper
```bash
# Set video + extract purple tones
~/.config/i3/scripts/video-wallpaper --next-colors

# Force neutral scheme for subtle look
~/.config/i3/scripts/wallpaper-colors -c neutral
```

### Quick theme refresh
```bash
# Reload all color configs
~/.config/i3/scripts/wallpaper-colors -r
```

### See what colors were extracted
```bash
# Display current palette
~/.config/i3/scripts/wallpaper-colors -s
```

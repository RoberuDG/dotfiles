# i3 Scripts Collection - EVA Unit-01 Edition

## 🌤️ Weather Widget (`weather-wttr`)
**Location:** `~/.config/i3/scripts/weather-wttr`

Displays weather for **Pola de Siero** using wttr.in (no API key needed!)

**Features:**
- Current temperature with feels-like
- Weather icons (sun, clouds, rain, snow, thunder)
- Color-coded by temperature
- Wind speed and direction

**Status bar:** Shows temperature with icon
**Colors:** Green (cold) → Blue → Orange → Red (hot)

---

## 📡 Network Speed (`network-speed`)
**Location:** `~/.config/i3/scripts/network-speed`

Real-time network monitoring

**Features:**
- Download/upload speed
- Auto-detects network interface
- Color-coded by traffic volume

**Status bar:** ` ↓1.5M ↑500k`
**Colors:** 
- Blue - Normal traffic
- Orange - High traffic (>10MB/s)
- Red - Very high (>100MB/s)

---

## ⏱️ Uptime Widget (`uptime-widget`)
**Location:** `~/.config/i3/scripts/uptime-widget`

System uptime display

**Features:**
- Days, hours, minutes format
- Color-coded by uptime length

**Status bar:** ` 5d 3h 20m`
**Colors:**
- Green - Less than 1 week
- Orange - 1-4 weeks
- Red - More than 1 month

---

## 📅 Calendar Widget (`calendar-widget`)
**Location:** `~/.config/i3/scripts/calendar-widget`

Date/time display with event notifications

**Features:**
- Current date and time
- Event detection from `~/.config/i3/calendar`
- Alert icon when events today

**Calendar file format** (`~/.config/i3/calendar`):
```
25/12 Christmas Party
14/02 Anniversary
01/01 New Year
```

**Status bar:** ` 17/02/2026 - 16:30`
**Colors:**
- Blue - Normal day
- Orange - Events today

---

## 📋 Clipboard Manager (`clipboard-manager`)
**Location:** `~/.config/i3/scripts/clipboard-manager`

Clipboard history manager with rofi

**Commands:**
```bash
# Show history (for status bar)
~/.config/i3/scripts/clipboard-manager --count

# Select from history
~/.config/i3/scripts/clipboard-manager --select
```

**Features:**
- Stores last 50 clipboard items
- Rofi-based selection
- Auto-copy on select

**Status bar:** ` 15 items`
**Click action:** Left-click to open history selector

---

## 📝 Quick Notes (`quick-notes`)
**Location:** `~/.config/i3/scripts/quick-notes`

Quick note-taking system

**Commands:**
```bash
# Add note from clipboard
~/.config/i3/scripts/quick-notes --add

# Show notes list
~/.config/i3/scripts/quick-notes --show

# Clear all notes
~/.config/i3/scripts/quick-notes --clear

# Show count (for status bar)
~/.config/i3/scripts/quick-notes --count
```

**Features:**
- Timestamp each note
- Copy notes to clipboard
- Persistent storage

**Status bar:** ` 5 notes`
**Click actions:**
- Left-click: View notes
- Right-click: Add note from clipboard

---

## 🎨 Color Scheme (EVA Unit-01)

| Color | Hex | Usage |
|-------|-----|-------|
| Purple | `#8A33FF` | Primary EVA color |
| Green | `#44FF88` | Neon accent |
| Blue | `#5D9CEC` | Network, cold |
| Lavender | `#B4BEFE` | Normal text |
| Orange | `#FFB347` | Warning |
| Red | `#FF5577` | Critical, hot |

---

## 📋 Installation Notes

All scripts are already installed in:
```
~/.config/i3/scripts/
```

They are configured in i3blocks at:
```
~/.config/i3/i3blocks.conf
```

To reload i3blocks after changes:
```bash
killall -SIGUSR1 i3blocks
```

Or reload i3:
```
Mod+Shift+r
```

---

## 🔧 Requirements

- `jq` - JSON parsing
- `curl` - HTTP requests
- `xclip` - Clipboard management
- `rofi` - Application launcher
- `dunst` - Notifications

Install with:
```bash
sudo pacman -S jq curl xclip rofi dunst
```

---

**"Get in the terminal, Shinji!"** 🤖

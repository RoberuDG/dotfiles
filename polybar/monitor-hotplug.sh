#!/bin/bash
# ╔════════════════════════════════════════════════════╗
# ║         EVA Unit-01 Polybar Monitor Hotplug        ║
# ╚════════════════════════════════════════════════════╝
# Called by monitor-watcher.sh when monitors change

# Just call the main launch script (it has proper cleanup)
exec ~/.config/polybar/launch.sh

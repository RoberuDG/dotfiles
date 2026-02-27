#!/bin/bash
# ╔════════════════════════════════════════════════════╗
# ║           EVA Unit-01 Polybar Launcher             ║
# ╚════════════════════════════════════════════════════╝

killall -q polybar

# Wait for polybar to fully terminate
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get connected monitors
monitors=($(xrandr --query | grep " connected" | cut -d" " -f1))

# Count monitors
count=${#monitors[@]}

echo "🟣 EVA Unit-01 Bar System Initializing..."
echo "📺 Detected $count monitor(s): ${monitors[*]}"

# Launch bars based on monitor count and name
if [[ $count -eq 1 ]]; then
    # Single monitor - use primary bar
    echo "🖥️  Single monitor setup: ${monitors[0]}"
    MONITOR=${monitors[0]} polybar --reload primary &
    
elif [[ $count -ge 2 ]]; then
    # Multi-monitor setup
    for i in "${!monitors[@]}"; do
        monitor=${monitors[$i]}
        case $i in
            0)
                # First monitor - Primary (full features)
                echo "🖥️  Primary bar on $monitor"
                MONITOR=$monitor polybar --reload primary &
                ;;
            1)
                # Second monitor - Secondary (medium)
                echo "🖥️  Secondary bar on $monitor"
                MONITOR=$monitor polybar --reload secondary &
                ;;
            2)
                # Third monitor - Tertiary (minimal)
                echo "🖥️  Tertiary bar on $monitor"
                MONITOR=$monitor polybar --reload tertiary &
                ;;
            *)
                # Additional monitors - Use tertiary
                echo "🖥️  Extra bar on $monitor"
                MONITOR=$monitor polybar --reload tertiary &
                ;;
        esac
    done
fi

echo "✅ EVA Unit-01 Bar System Ready!"

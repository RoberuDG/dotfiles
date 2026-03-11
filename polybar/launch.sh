#!/bin/bash
# ╔════════════════════════════════════════════════════╗
# ║           EVA Unit-01 Polybar Launcher             ║
# ════════════════════════════════════════════════════╝

# Prevent multiple instances with lock file
LOCKFILE="/tmp/polybar-launch.lock"
if [ -f "$LOCKFILE" ]; then
    echo "⚠️  Polybar launch already in progress, skipping..."
    exit 1
fi
touch "$LOCKFILE"
trap "rm -f $LOCKFILE" EXIT

# Kill all existing polybar instances forcefully
echo "🔴 Stopping existing polybar instances..."
killall -9 -q polybar 2>/dev/null

# Wait for polybar to fully terminate (max 3 seconds)
sleep 1
for i in {1..3}; do
    if ! pgrep -u $UID -x polybar >/dev/null; then
        break
    fi
    sleep 1
done

# Force kill if still running
if pgrep -u $UID -x polybar >/dev/null; then
    echo "⚠️  Force killing stubborn polybar processes..."
    pkill -9 -u $UID -x polybar
    sleep 0.5
fi

# Get connected monitors (filter for actual connected displays)
mapfile -t monitors < <(xrandr --query | grep " connected" | grep -v "disconnected" | awk '{print $1}')

# Count monitors
count=${#monitors[@]}

echo "🟣 EVA Unit-01 Bar System Initializing..."
echo "📺 Detected $count monitor(s): ${monitors[*]}"

# Exit if no monitors found
if [[ $count -eq 0 ]]; then
    echo "❌ No connected monitors found!"
    exit 1
fi

# Launch bars based on monitor count and name
if [[ $count -eq 1 ]]; then
    # Single monitor - use primary bar
    echo "🖥️  Single monitor setup: ${monitors[0]}"
    MONITOR=${monitors[0]} polybar --reload primary 2>&1 &

elif [[ $count -ge 2 ]]; then
    # Multi-monitor setup
    for i in "${!monitors[@]}"; do
        monitor=${monitors[$i]}
        case $i in
            0)
                # First monitor - Primary (full features)
                echo "🖥️  Primary bar on $monitor"
                MONITOR=$monitor polybar --reload primary 2>&1 &
                ;;
            1)
                # Second monitor - Secondary (medium)
                echo "🖥️  Secondary bar on $monitor"
                MONITOR=$monitor polybar --reload secondary 2>&1 &
                ;;
            2)
                # Third monitor - Tertiary (minimal)
                echo "🖥️  Tertiary bar on $monitor"
                MONITOR=$monitor polybar --reload tertiary 2>&1 &
                ;;
            *)
                # Additional monitors - Use tertiary
                echo "🖥️  Extra bar on $monitor"
                MONITOR=$monitor polybar --reload tertiary 2>&1 &
                ;;
        esac
    done
fi

echo "✅ EVA Unit-01 Bar System Ready!"

#!/usr/bin/env bash
# ╔═══════════════════════════════════════════════════════════════════════════════╗
# ║                    VIDEO WALLPAPER DOWNSCALER                                 ║
# ║                    Convert 4K videos to 1080p for performance                 ║
# ╚═══════════════════════════════════════════════════════════════════════════════╝

OUTPUT_DIR="$HOME/Pictures/Wallpapers/EVA/1080p"
mkdir -p "$OUTPUT_DIR"

echo "🎬 Converting 4K videos to 1080p..."
echo "Output: $OUTPUT_DIR"
echo ""

for video in ~/Pictures/Wallpapers/EVA/*.mp4; do
    [ ! -f "$video" ] && continue
    
    filename=$(basename "$video")
    output="$OUTPUT_DIR/$filename"
    
    # Skip if already converted
    [ -f "$output" ] && echo "⏭️  Skip: $filename (already converted)" && continue
    
    echo "📹 Converting: $filename"
    
    # Convert with ffmpeg
    # - vf scale=-1:1080: Keep aspect ratio, 1080p height
    # - c:v libx264: H.264 encoder (good compatibility)
    # - crf 23: Quality (18-28, lower=better, 23=default)
    # - preset fast: Faster encoding
    # - c:a copy: Copy audio without re-encoding
    ffmpeg -i "$video" \
        -vf "scale=-1:1080" \
        -c:v libx264 -crf 23 -preset fast \
        -c:a copy \
        -y "$output" 2>&1 | tail -5
    
    echo "✅ Done: $filename"
    echo ""
done

echo "═══════════════════════════════════════════"
echo "✨ Conversion complete!"
echo "═══════════════════════════════════════════"
echo ""
echo "Original size:"
du -sh ~/Pictures/Wallpapers/EVA/*.mp4 2>/dev/null | awk '{sum+=$1} END {print "  " sum " MB"}'
echo ""
echo "New size (1080p):"
du -sh "$OUTPUT_DIR"/*.mp4 2>/dev/null | awk '{sum+=$1} END {print "  " sum " MB"}'

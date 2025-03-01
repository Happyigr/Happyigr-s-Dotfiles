#!/bin/bash
# Get the direct stream URL using yt-dlp
URL=$(yt-dlp -f 401 -g "https://www.youtube.com/watch?v=Z90rTdVoomY") || {
    echo "Error: Failed to fetch stream URL"
    exit 1
}

# Debugging (uncomment this if needed)
# echo "Using URL: $URL"

# Run mpv inside the xwinwrap window
mpv --no-audio --wid="$1" --loop "$URL"


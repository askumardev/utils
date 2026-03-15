#!/bin/bash

# 1. Set your start date (YYYY-MM-DD)
START_DATE="2026-01-01"

# 2. Get the current date in seconds
CURRENT_DATE=$(date +%s)
# Convert start date to seconds
ITER_DATE=$(date -d "$START_DATE" +%s)

# 3. Loop until we hit today
while [ "$ITER_DATE" -le "$CURRENT_DATE" ]; do
    # Format the date for Git
    FORMATTED_DATE=$(date -d "@$ITER_DATE" +"%Y-%m-%d 12:00:00")
    
    # Create an empty commit (no file changes needed)
    GIT_AUTHOR_DATE="$FORMATTED_DATE" \
    GIT_COMMITTER_DATE="$FORMATTED_DATE" \
    git commit --allow-empty -m "Retroactive contribution for $FORMATTED_DATE"
    
    # Advance by 1 day (86400 seconds)
    ITER_DATE=$((ITER_DATE + 86400))
done

echo "Finished! Run 'git push origin main' to update your profile."
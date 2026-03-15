#!/bin/bash

# 1. Set your start date (YYYY-MM-DD)
START_DATE="2026-01-01"


# Probability of committing at all on a given day (0-100)
CHANCE_OF_WORK=80 

# 2. Setup timing
CURRENT_DATE=$(date +%s)
ITER_DATE=$(date -d "$START_DATE" +%s)

# 3. Main Loop
while [ "$ITER_DATE" -le "$CURRENT_DATE" ]; do
    # Generate a random number between 1 and 100
    ROLL=$(( ( RANDOM % 100 )  + 1 ))

    if [ "$ROLL" -le "$CHANCE_OF_WORK" ]; then
        # Determine intensity: Random number of commits (1 to 5)
        # More commits = Darker Green
        NUM_COMMITS=$(( ( RANDOM % 5 ) + 1 ))
        
        FORMATTED_DATE=$(date -d "@$ITER_DATE" +"%Y-%m-%d 12:00:00")
        
        for ((i=1; i<=NUM_COMMITS; i++)); do
            GIT_AUTHOR_DATE="$FORMATTED_DATE" \
            GIT_COMMITTER_DATE="$FORMATTED_DATE" \
            git commit --allow-empty -m "Update module $i for $FORMATTED_DATE" --quiet
        done
        echo "Added $NUM_COMMITS commits for $FORMATTED_DATE"
    else
        echo "Skipping $(date -d "@$ITER_DATE" +"%Y-%m-%d") (Rest day)"
    fi

    # Advance by 1 day
    ITER_DATE=$((ITER_DATE + 86400))
done

echo "Timeline complete. Push to see the masterpiece."

# in terminal on the proj main dir

#~/code/utils$ sudo chmod +x fill.sh

# ~/code/utils$ ./fill.sh
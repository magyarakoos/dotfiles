#!/bin/bash

# Navigate to the ~/repos/ directory
cd ~/repos/

# Loop through all subdirectories
for directory in */; do
    cd ~/repos/"$directory"
    echo "Current working directory: $directory"
    git-sync.sh
done

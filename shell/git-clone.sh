#!/bin/bash

# Prompt user for GitHub repository URL
read -p "Enter GitHub repository URL: " repo_url

# Parse repository name from the URL
repo_name=$(basename "$repo_url" | sed 's/\.git$//')

# Print the repository name
echo "Repository Name: $repo_name"

# Clone the repository
git clone $repo_url

# Change directory to the cloned repository
cd "$repo_name"

# Assuming git-cred.sh is a script related to handling credentials, execute it
git-cred.sh $repo_name

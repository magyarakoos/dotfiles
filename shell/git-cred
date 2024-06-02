#!/bin/bash

# Ask for the username
read -p "Username: " username

# Check if $1 exists, if not, ask for the repository name
repo_name=$1
if [ -z "$repo_name" ]; then
    repo_name=$(basename $(pwd))
fi

# Ask for the personal access token (hidden input)
read -s -p "Personal access token: " access_token

# Output a new line for better formatting
echo 

# Set credentials for the current repository
git remote set-url origin https://"$username":"$access_token"@github.com/"$username"/"$repo_name".git

echo "Done!"

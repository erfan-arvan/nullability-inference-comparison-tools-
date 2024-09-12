#!/bin/bash

# Define the repository URL
repo_url="https://github.com/thoriumrobot/nullgtn-artifact"

# Clone the repository
echo "Cloning the repository..."
git clone "$repo_url"

# Extract the repository name from the URL (nullgtn-artifact)
repo_name=$(basename "$repo_url" .git)

# Check if the clone was successful
if [ -d "$repo_name" ]; then
    echo "Repository cloned successfully."
else
    echo "Error: Failed to clone the repository."
fi

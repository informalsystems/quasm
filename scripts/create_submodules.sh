#!/bin/bash

# Loop through the list of Git repositories and clone them as submodules
while IFS= read -r line; do
    # Check if the line contains a GitHub repository URL
    if [[ $line == *"https://github.com/"* ]]; then
        # Extract the GitHub repository URL
        REPO_URL=$(echo "$line" | sed 's/^.*\[.*\](\(.*\))/\1/g' | sed 's/\/tree.*//g')

        # Extract the repository name (e.g., "repo-name.git") from the URL
        REPO_NAME=$(basename "$REPO_URL")

        # Remove ".git" extension, if it exists
        REPO_NAME=${REPO_NAME%.git}

        # Add the repository as a submodule
        git submodule add "$REPO_URL" "submodules/$REPO_NAME"
    fi
done < contracts.md

# Initialize and update the submodules
git submodule update --init --recursive

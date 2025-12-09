#!/bin/bash

# Configure git
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"

# Check if there are any changes (new files or modifications)
if [[ -n $(git status --porcelain) ]]; then
  echo "Changes detected, committing..."
  git add .
  git commit -m "Auto-update: Downloaded images from Aziza catalog"
  git push
else
  echo "No changes to commit"
fi
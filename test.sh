#!/bin/bash

git config --global user.name "beet-aizu"
git config --global user.email "aki.bdash@gmail.com"

git remote set-url origin https://beet-aizu:${GITHUB_TOKEN}@github.com/beet-aizu/github_actions.git

last_commit_message="$(git log -1 | tail -1)"
echo $last_commit_message
echo $last_commit_message | grep [updater]

if [ -z "$(echo $last_commit_message | grep [updater])" ]; then
    git log -1 | head -1 > last_commit.txt
    git add last_commit.txt
    git commit -m '[updater] update last commit'
    git push origin HEAD
fi

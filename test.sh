#!/bin/bash

git config --global user.name "updater"
git config --global user.email "updater@example.com"

git remote set-url origin https://beet-aizu:${GITHUB_TOKEN}@github.com/beet-aizu/github_actions.git

git log -1 | head -1 > last_commit.txt

cat last_commit.txt

git add last_commit.txt

git commit -m 'update last commit'

git log

git status

git branch

git push origin master

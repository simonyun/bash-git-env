#!/usr/bin/env bash

git config --global user.name "Simon Yun"
git config --global user.email "simon@nuro.ai"

git config --global color.ui true
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global diff.renamelimit 10000
git config --global diff.renames true
# git config --global push.default simple
# git config --global http.postBuffer 524288000

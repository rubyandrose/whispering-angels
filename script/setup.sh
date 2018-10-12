#!/usr/bin/env bash

cd "$(dirname "$0")/.." || exit

source script/helpers.sh

script/bootstrap.sh || exit

task_inform "Setting up your app..."

subtask_exec "Rehashing RBenv" rbenv rehash

task_inform "Cleaning up..."

subtask_exec "Cleaning up tmp log" rm "$LOGFILE"

task_inform "Checking setup..."

echo "Your app is almost set up."
echo "Run `rails db:setup` and then run `rails server` and navigate to http://localhost:3000 in your browser to see a local running copy."

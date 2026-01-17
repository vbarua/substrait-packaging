#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <branch name>"
  exit 1
fi

BRANCH_NAME="$1"

if git show-ref --quiet $BRANCH_NAME; then
    echo true
else
    echo false
fi
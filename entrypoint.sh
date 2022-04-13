#!/bin/bash
DURATION="${1-.}" # 1day == 86400
CHANGED=false     # false by default
echo "Checking if last commit on current branch was less than ${DURATION} seconds ago"
git config --global --add safe.directory /github/workspace # fix for https://github.blog/2022-04-12-git-security-vulnerability-announced/
declare -i latest=$(git show --format="%ct" HEAD | head -n 1) against=$(date +%s)-${DURATION}
if [ "$against" -lt "$latest" ]; then CHANGED=true; fi

echo ::set-output name=changed::$CHANGED

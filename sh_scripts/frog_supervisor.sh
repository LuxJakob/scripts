#!/bin/bash

REPO_OWNER="LuxJakob"
REPO_NAME="scripts"
GITHUB_TOKEN=$1
ACTION_NAME="frog_worker.yaml"
TODAYS_COMMITS=$((RANDOM % 5 + 1))

for ((i=1; i<=TODAYS_COMMITS; i++))
do
  curl -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/workflows/$ACTION_NAME/dispatches \
    -d '{"ref":"main"}' \
    -v

  echo "Round $i of $TODAYS_COMMITS"
  sleep 300
done

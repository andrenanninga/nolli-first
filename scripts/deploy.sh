#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "current branch: $BRANCH"
pwd

printenv

npm -t $NOW_TOKEN run-script deploy
now -t $NOW_TOKEN alias "nollie-${BRANCH}.nannin.ga"

#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "current branch: $BRANCH"
pwd

printenv

# npm -t run-script deploy
# now alias "nollie-${BRANCH}.nannin.ga"

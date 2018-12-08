#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "current branch: $BRANCH"
pwd

npm run-script deploy
now alias "nollie-${BRANCH}.nannin.ga"

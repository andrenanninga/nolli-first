#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "current branch: $BRANCH"

now -t $NOW_TOKEN deploy

if [ $BRANCH = "master" ]; then
	now -t $NOW_TOKEN alias "nolli.nannin.ga"
else
	now -t $NOW_TOKEN alias "nollie-${BRANCH}.nannin.ga"
fi

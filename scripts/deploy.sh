#!/bin/bash

if [[ $TRAVIS_BRANCH ]]; then
	BRANCH="$TRAVIS_BRANCH";
else
	BRANCH=$(git rev-parse --abbrev-ref HEAD);
fi

echo "Current branch: $BRANCH";

now -t "$NOW_TOKEN" --debug --force --no-clipboard deploy;

if [ $BRANCH = "master" ]; then
	now -t "$NOW_TOKEN" alias "nolli.nannin.ga";
else
	now -t "$NOW_TOKEN" alias "nollie-$BRANCH.nannin.ga";
fi

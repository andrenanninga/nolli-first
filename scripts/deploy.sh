#!/bin/bash

if [[ $TRAVIS_BRANCH ]]; then
	BRANCH="$TRAVIS_BRANCH";
else
	BRANCH=$(git rev-parse --abbrev-ref HEAD);
fi

echo "Current branch: $BRANCH";

now -t "$NOW_TOKEN" --no-clipboard --regions=bru deploy;

if [ $BRANCH = "master" ]; then
	now -t "$NOW_TOKEN" alias "nolli.nannin.ga";
else
	now -t "$NOW_TOKEN" alias "nollie-$BRANCH.nannin.ga";
fi

printenv;


# curl "https://api.github.com/repos/nolli/my_repo/statuses/$GIT_COMMIT?access_token=abc123" \
#   -H "Content-Type: application/json" \
#   -X POST \
#   -d "{\"state\": \"$STATUS\", \"description\": \"Jenkins\", \"target_url\": \"http://my.jenkins.box.com/job/dividata/$BUILD_NUMBER/console\"}"

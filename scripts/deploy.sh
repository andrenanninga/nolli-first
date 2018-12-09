#!/bin/bash

function status {
	GIT_COMMIT=$(git rev-parse HEAD);
	curl "http://api.github.com/repos/$TRAVIS_REPO_SLUG/statuses/$GIT_COMMIT?access_token=$GITHUB_ACCESS_TOKEN" \
		-H "Content-Type: application/json" \
		-X POST \
		-d "{\"state\": \"$1\", \"description\": \"Deployment at $ALIAS\", \"target_url\": \"https://$ALIAS\"}"
}

if [[ $TRAVIS_BRANCH ]]; then
	BRANCH="$TRAVIS_BRANCH";
else
	BRANCH=$(git rev-parse --abbrev-ref HEAD);
fi

if [ $BRANCH = "master" ]; then
	ALIAS="nolli.nannin.ga";
else
	ALIAS="nolli-$BRANCH.nannin.ga";
fi

echo "Current branch: $BRANCH, deployment target: $ALIAS";
status "pending"

now -t "$NOW_TOKEN" --no-clipboard --regions=bru deploy;
now -t "$NOW_TOKEN" alias "$ALIAS";

status "success"


# curl "https://api.github.com/repos/nolli/my_repo/statuses/$GIT_COMMIT?access_token=abc123" \
#   -H "Content-Type: application/json" \
#   -X POST \
#   -d "{\"state\": \"$STATUS\", \"description\": \"Jenkins\", \"target_url\": \"http://my.jenkins.box.com/job/dividata/$BUILD_NUMBER/console\"}"

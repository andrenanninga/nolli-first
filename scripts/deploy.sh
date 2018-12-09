#!/bin/bash

# Post a 'nolli/deployment' status with the deployment url to the commit/pull request
function status {
	GIT_COMMIT=$(git rev-parse HEAD);
	curl --silent "https://api.github.com/repos/$TRAVIS_REPO_SLUG/statuses/$GIT_COMMIT" \
		-u "fakeyou:$GITHUB_ACCESS_TOKEN" \
		-H "Content-Type: application/json" \
		-X POST \
		-d "{\"context\": \"nolli/deployment\", \"state\": \"$1\", \"description\": \"Deployment at $ALIAS\", \"target_url\": \"https://$ALIAS\"}";
}

BRANCH="$TRAVIS_BRANCH";
ALIAS=$([ $BRANCH = "master" ] && echo "nolli.nannin.ga" || echo "nolli-$BRANCH.nannin.ga");

echo "Current branch: $BRANCH, deployment target: $ALIAS";
status "pending";

{
	# Deploy to now.sh
	now -t "p$NOW_TOKEN" --no-clipboard --regions=bru deploy &&
	now -t "p$NOW_TOKEN" alias "$ALIAS" &&
	status "success"
} || {
	# Deployment has failed
	status "failure"
	exit 1
}

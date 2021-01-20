#!/bin/bash
set -ex

echo "GIT_CLONE_COMMIT_MESSAGE_SUBJECT: ${GIT_CLONE_COMMIT_MESSAGE_SUBJECT}"

if echo "$GIT_CLONE_COMMIT_MESSAGE_SUBJECT" | egrep -iq "\[skip ci\]|\[ci skip\]" ; then
   echo "Skipping..."
   curl -X POST -H "Authorization: $BITRISE_ACCESS_TOKEN" "https://api.bitrise.io/v0.1/apps/$BITRISE_APP_SLUG/builds/$BITRISE_BUILD_SLUG/abort" -d '{"abort_reason": "Intentionally skipping build..."}'
fi
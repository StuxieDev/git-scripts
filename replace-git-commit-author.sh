#!/bin/sh

git filter-branch -f --env-filter '
OLD_EMAIL="your@old.email"
OLD_NAME="Your Old Name"
CORRECT_EMAIL="your@correct.email"
CORRECT_NAME="Your Correct Name"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ] && [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ] && [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
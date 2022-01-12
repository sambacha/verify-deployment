#!/bin/bash

FILES=( $(git status --porcelain | grep ^M) );
V=$(date -u +%Y-%m-%d);

git_info () {
echo export default \"{\\\"logMessage\\\": \\\"$(git log -1 --oneline)\\\"}\"  > src/_git_commit.js
}

exit 0;

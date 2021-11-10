#!/bin/bash
start=$(date +%s)

npx next build
sleep 1
now=$(date +%s)

npx next start "$VERSION" new -e ENVIRONMENT -t $((now-start))

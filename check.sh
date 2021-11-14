#!/bin/bash

S_HASH=$(node -e 'process.stdout.write("sha256-");process.stdin.pipe(crypto.createHash("sha256").setEncoding("base64")).pipe(process.stdout)' < yarn.lock) 
echo "${S_HASH}" >> public/.well-known/SRI_HASH
git show -s --format=%ct HEAD > public/.well-known/commit-ts.txt

sleep 1

printf 'https://app.sushi.com/%s\n' */* | sort > INDEX

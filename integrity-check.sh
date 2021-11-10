#!/bin/bash
# @see {@link https://nodejs.org/api/policy.html#integrity-checks}
echo "Generating Integrity checks..."
node -e 'process.stdout.write("sha256-");process.stdin.pipe(crypto.createHash("sha256").setEncoding("base64")).pipe(process.stdout)' < "$@"
sleep 1

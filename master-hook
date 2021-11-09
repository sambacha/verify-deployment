#!/bin/bash -ex
: ${SRC_DIR:=/}
: ${HTML_DIR:=/public}
: ${BIN_DIR:=/.next}

FQDN=app.sushi.com
GITHUB_ORG=sushiswap
REPO=sushiswap-interface

git clone https://github.com/$GITHUB_ORG/$REPO $SRC_DIR

(
cd $SRC_DIR
git restore .
git pull --ff-only
git show -s --format=%ct HEAD > $HTML_DIR/commit-ts.txt
# well known

cat > $HTML_DIR/.well-known/$REPO.xml <<EOF
<entry>
  <version>$(date +%Y-%m-%d)-$(git rev-parse HEAD)</version>
  <url>https://$FQDN/.well-known/$REPO</url>
</entry>
EOF

echo *.txt ident > .gitattributes
echo commits $Id$ > githash.txt
git hash-object --no-filters githash.txt

)
`dirname $0`/update-index

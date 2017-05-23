#!/bin/bash

set -e

VERSION=$(cat version/version)

pushd prometheus-custom-git
./extract.sh ../prometheus-release-git

git config --global user.email "releasebot@c0.pivotal.io"
git config --global user.name "Releasebot"

cat > config/private.yml << EOF
---
blobstore:
  s3:
    access_key_id: ${AWS_ACCESS_KEY}
    secret_access_key: ${AWS_SECRET_KEY}
EOF

bosh -n create release --final --with-tarball --version "${VERSION}"

git add . && git commit -m "New release"

popd

cp -r prometheus-custom-git/. pushme
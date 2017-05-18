#!/bin/bash

set -e

pushd prometheus-custom-git
./extract.sh ../prometheus-release-git

git config --global user.email "releasebot@c0.pivotal.io"
git config --global user.name "Releasebot"

git add . && git commit -m "New release"

popd

cp -r prometheus-custom-git/. pushme
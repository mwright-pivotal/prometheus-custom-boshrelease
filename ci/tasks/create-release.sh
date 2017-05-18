#!/bin/bash

set -e

./extract.sh

git add . && git commit -m "New release"


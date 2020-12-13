#!/bin/bash

set -ex

if [ -z "$1" ]
then
# after https://stackoverflow.com/a/6245587/1219585
  ARG="./$(git rev-parse --abbrev-ref HEAD).md"
else
  ARG="$1"
fi

if [ -z "$2" ]
then
  MSG="WIP"
else
  MSG="$2"
fi

git add $ARG
git commit -m $MSG
git push

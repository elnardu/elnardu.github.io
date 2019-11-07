#!/bin/bash

set -e

git clone https://github.com/elnardu/elnardu.github.io dist

pushd dist
git checkout master
rm -rf *
popd

cp -r src/.vuepress/dist/* dist/

pushd dist
git add -A
git commit -m "Website"
git push -u origin master --force
popd
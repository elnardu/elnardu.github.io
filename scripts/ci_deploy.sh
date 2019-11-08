#!/bin/bash

set -e

git config --global user.email "elnardu2@gmail.com"
git config --global user.name "Elnard Utiushev"

git clone https://elnardu:$GITHUB_TOKEN@github.com/elnardu/elnardu.github.io.git dist

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
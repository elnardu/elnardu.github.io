#!/bin/bash

set -e

git config --global user.email "elnardu2@gmail.com"
git config --global user.name "Elnard Utiushev"

git clone https://github.com/elnardu/elnardu.github.io dist

pushd dist
git checkout master
rm -rf *
popd

cp -r src/.vuepress/dist/* dist/

pushd dist
git add -A
git commit -m "Website"
git -c http.extraheader="AUTHORIZATION: basic $GITHUB_TOKEN" push -u origin master --force
popd
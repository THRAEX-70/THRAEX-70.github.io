#!/usr/bin/env sh
# Deploy to Root

set -e

yarn docs:build

cd docs/.vuepress/dist

git init
# git clone git@github.com:O70/O70.github.io.git pages
# cp -r pages/.git .
# rm -rf pages
git add -A
git commit -m 'deploy'

# git push -f git@github.com:O70/note-paper.git dev:gh-pages
git push -f git@github.com:O70/O70.github.io.git master
git push -f git@gitee.com:Guiwang/Guiwang.git master
git push -f git@git.dev.tencent.com:THRAEX/THRAEX.git master

cd -

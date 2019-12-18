#!/usr/bin/env sh
# Deploy to Root

set -e

yarn docs:build

cd docs/.vuepress/dist

git init
git add -A
git commit -m 'deploy'

# git push -f git@github.com:O70/note-paper.git dev:gh-pages
git push -f git@github.com:O70/O70.github.io.git master:gh-pages
git push -f git@gitee.com:Guiwang/Guiwang.git master:gh-pages
git push -f git@git.dev.tencent.com:THRAEX/THRAEX.git master:gh-pages

cd -

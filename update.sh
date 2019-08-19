#!/usr/bin/env bash
cd $(dirname ${BASH_SOURCE[0]})

date -R
git add -A && git commit -m "Daily automated config update" && git push
echo

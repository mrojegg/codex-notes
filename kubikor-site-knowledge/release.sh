#!/usr/bin/env sh
set -eu
rm -f site-release.zip
zip -q site-release.zip index.html
printf "Готово: %s/site-release.zip\n" "$(pwd)"

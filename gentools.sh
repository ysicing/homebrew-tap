#!/bin/bash

set -e

cd /root/homebrew-tap
git add .
name=$1
version=$2
datetime=$(date +%F-%H-%M)
git commit -m "release ${name} ${version} by bot ${datetime}"
git push origin master

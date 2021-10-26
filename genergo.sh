#!/bin/bash

set -e

cd /root/homebrew-tap
docker pull ysicing/taprb:ergo
docker run -i -v $PWD:/data --rm ysicing/taprb:ergo cp -a /ergo.rb /data/ergo.rb
git add .
version=$(cat ergo.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release ergo ${version} by bot ${datetime}"
git push origin master

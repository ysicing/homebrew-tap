#!/bin/bash

set -e

cd /root/homebrew-tap
docker pull ysicing/taprb:crtools
docker run -it -v $PWD:/data --rm ysicing/taprb:crtools cp -a /crtools.rb /data/crtools.rb
git add .
version=$(cat crtools.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release crtools ${version} by bot ${datetime}"
git push origin master

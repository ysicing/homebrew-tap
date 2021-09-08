#!/bin/bash

set -e

cd /root/homebrew-tap
docker pull ysicing/taprb:ergov2
docker run -it -v $PWD:/data --rm ysicing/taprb:ergov2 cp -a /ergo.rb /data/ergov2.rb
git add .
version=$(cat ergov2.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release ergov2 ${version} by bot ${datetime}"
git push origin master

#!/bin/bash

set -e

cd /root/homebrew-tap
docker pull ysicing/taprb:kr
docker run -i -v $PWD:/data --rm ysicing/taprb:kr cp -a /kr.rb /data/kr.rb
git add .
version=$(cat kr.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release kr ${version} by bot ${datetime}"
git push origin master

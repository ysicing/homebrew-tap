#!/bin/bash

set -e

cd /root/homebrew-tap
# docker pull ysicing/taprb:ergo
#docker run -it -v $PWD:/data --rm ysicing/taprb:ergo cp -a /ergo.rb /data/ergo.rb
git add .
name=$1
version=$2
datetime=$(date +%F-%H-%M)
git commit -m "release ${name} ${version} by bot ${datetime}"
git push origin master

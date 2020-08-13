#!/bin/bash

docker pull ysicing/taprb:ergo
docker run -it -v $PWD:/data --rm ysicing/taprb:ergo cp -a /ergo.rb /data/ergo.rb
git add .
version=$(cat ergo.rb | grep "version " | awk -F\" '{print $2}')
git commit -m "release ergo ${version}"
git push origin master

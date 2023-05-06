#!/bin/bash

set -e

git clone https://github.com/ysicing/tiga.git /tmp/tiga

cd /root/homebrew-tap

cp /tmp/tiga/docs/tiga.rb .

git add .
version=$(cat tiga.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release tiga ${version} by bot ${datetime}"
git push origin master

rm -rf /tmp/tiga

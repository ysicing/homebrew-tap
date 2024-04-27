#!/bin/bash

set -e

[ -d .tmptiga ] && rm -rf .tmptiga || true

git clone https://github.com/ysicing/tiga.git .tmptiga

cp .tmptiga/docs/tiga.rb .

rm -rf .tmptiga

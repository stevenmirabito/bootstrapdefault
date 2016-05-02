#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "Usage: release.sh <version>"
fi
mkdir -p $1/csh
mkdir -p $1/csh/bootstrap/dist
mkdir -p $1/csh/selectize.js/dist
mkdir -p $1/csh/bootstrap-csh/release
cp -rv bootstrap/dist/* $1/csh/bootstrap/dist
cp -rv selectize.js/dist/* $1/csh/selectize.js/dist
cp -rv bootstrap-csh/dist/* $1/csh/bootstrap-csh/release
cp -rv admin fixplugins.css img include index.php js language less local_head.tpl screenshot.png template theme.css themeconf.inc.php $1/csh/
cd $1
zip -r ../csh-$1.zip csh
cd ..
rm -r $1

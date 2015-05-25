#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "Usage: release.sh <version>"
fi
mkdir -p $1/bootstrapdefault
mkdir -p $1/bootstrapdefault/bootstrap/dist
mkdir -p $1/bootstrapdefault/selectize.js/dist
cp -rv bootstrap/dist/* $1/bootstrapdefault/bootstrap/dist
cp -rv selectize.js/dist/* $1/bootstrapdefault/selectize.js/dist
cp -rv fixplugins.css img js less local_head.tpl template theme.css themeconf.inc.php $1/bootstrapdefault/
cd $1
zip -r ../bootstrapdefault-$1.zip bootstrapdefault
cd ..
rm -r $1

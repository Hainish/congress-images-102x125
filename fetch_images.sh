#!/bin/bash
set -e

rm -rf i
svn checkout https://github.com/unitedstates/images/trunk/congress/225x275
mkdir i resized
cd 225x275
for x in `ls *.jpg`; do
  echo "Converting $x to 102x125 and optimizing..."
  convert $x -resize 102x125 -quality .6 ../resized/$x
  jpegtran -copy none -optimize -progressive ../resized/$x > ../i/$x
done
cd ..
rm -rf 225x275 resized

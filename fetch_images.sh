#!/bin/bash
set -e

rm -rf i
svn checkout https://github.com/unitedstates/images/trunk/congress/225x275
mkdir i
cd 225x275
for x in `ls *.jpg`; do
  echo "Converting $x to 102x125..."
  convert $x -resize 102x125 ../i/$x
done
cd ..
rm -rf 225x275

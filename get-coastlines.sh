#!/bin/bash 
ROOT=$PWD

rm water-polygons-split-4326.zip 
wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip 
unzip -j -o -d ./coastlines/ water-polygons-split-4326.zip 
rm water-polygons-split-4326.zip 
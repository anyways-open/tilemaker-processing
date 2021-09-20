#!/bin/bash 
ROOT=$PWD

wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip
unzip -j -d ./coastlines/ water-polygons-split-4326.zip
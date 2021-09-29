#!/bin/bash 
ROOT=$PWD

# get urban areas.
mkdir -p landcover/ne_10m_urban_areas
cd landcover/ne_10m_urban_areas 
rm -rf ne_10m_urban_areas.zip
wget https://staging.anyways.eu/planet/naturalearth/ne_10m_urban_areas.shp
unzip -o ne_10m_urban_areas.zip
cd $ROOT

# get water polygons.
rm water-polygons-split-4326.zip 
wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip 
unzip -j -o -d ./coastline/ water-polygons-split-4326.zip 
rm water-polygons-split-4326.zip 






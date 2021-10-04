#!/bin/bash 
ROOT=$PWD

# get urban areas.
mkdir -p landcover/ne_10m_urban_areas
cd landcover/ne_10m_urban_areas 
rm -rf ne_10m_urban_areas.zip
wget http://planet.anyways.eu/naturalearth/ne_10m_urban_areas.zip
unzip -o ne_10m_urban_areas.zip
cd $ROOT

# get ice shelves.
mkdir -p landcover/ne_10m_antarctic_ice_shelves_polys
cd landcover/ne_10m_antarctic_ice_shelves_polys 
rm -rf ne_10m_antarctic_ice_shelves_polys.zip
wget http://planet.anyways.eu/naturalearth/ne_10m_antarctic_ice_shelves_polys.zip
unzip -o ne_10m_antarctic_ice_shelves_polys.zip
cd $ROOT

# get glaciated areas.
mkdir -p landcover/ne_10m_glaciated_areas
cd landcover/ne_10m_glaciated_areas 
rm -rf ne_10m_glaciated_areas.zip
wget http://planet.anyways.eu/naturalearth/ne_10m_glaciated_areas.zip
unzip -o ne_10m_glaciated_areas.zip

# get water polygons.
rm water-polygons-split-4326.zip 
wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip 
unzip -j -o -d ./coastline/ water-polygons-split-4326.zip 
rm water-polygons-split-4326.zip 






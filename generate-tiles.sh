#!/bin/bash 
ROOT=$PWD
OUTPUT=$1

# download latest dump.
rm belgium-and-neighbourhood-bbox-latest.osm.pbf
wget https://staging.anyways.eu/planet/planet/extracts/belgium-and-neighbourhood-bbox-latest.osm.pbf

# generate tiles.
docker run -v ${ROOT}:/in -v ${OUTPUT}:/out -v ${ROOT}/coastline/:/coastline -v ${ROOT}/config/:/config -i -t --rm tilemaker /in/belgium-and-neighbourhood-bbox-latest.osm.pbf --output=/out/belgium-and-neighbourhood-bbox.mbtiles --process=/config/process-openmaptiles.lua
#!/bin/bash 
ROOT=$PWD
OUTPUT=$1

# download latest dump.
rm belgium-and-neighbourhood-bbox-latest.osm.pbf
wget http://planet.anyways.eu/planet/extracts/belgium-and-neighbourhood-bbox-latest.osm.pbf

# generate tiles.
mkdir out
docker run -v ${ROOT}:/in -v ${ROOT}/out:/out -v ${ROOT}/coastline/:/coastline -v ${ROOT}/config/:/config -i -t --rm anywaysopen/tilemaker:staging /in/belgium-and-neighbourhood-bbox-latest.osm.pbf --output=/out/openmaptiles.mbtiles --process=/config/process-openmaptiles.lua

# rename old files
olddate=$(date -r "${OUTPUT}/openmaptiles.mbtiles" "+%Y%m%d")
rm ${OUTPUT}/openmaptiles-${olddate}.mbtiles
rm ${OUTPUT}/openmaptiles-${olddate}.mbtiles.md5
mv ${OUTPUT}/openmaptiles.mbtiles ${OUTPUT}/openmaptiles-${olddate}.mbtiles
mv ${OUTPUT}/openmaptiles.mbtiles.md5 ${OUTPUT}/openmaptiles-${olddate}.mbtiles.md5

# move files to output folder.
mv ${ROOT}/out/openmaptiles.mbtiles ${OUTPUT}/openmaptiles.mbtiles
cd ${OUTPUT}
md5sum openmaptiles.mbtiles > openmaptiles.mbtiles.md5

cd ${ROOT}
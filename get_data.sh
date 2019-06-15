#!/bin/bash

set -e

# Get MagnaTagATune dataset. Details here:
#   http://mirg.city.ac.uk/codeapps/the-magnatagatune-dataset

if ! [ -d data ]; then
    wget -P data http://mi.soi.city.ac.uk/datasets/magnatagatune/annotations_final.csv

    wget http://mi.soi.city.ac.uk/datasets/magnatagatune/mp3.zip.001
    wget http://mi.soi.city.ac.uk/datasets/magnatagatune/mp3.zip.002
    wget http://mi.soi.city.ac.uk/datasets/magnatagatune/mp3.zip.003

    cat mp3.zip.* > mp3.zip
    zip -FF mp3.zip --out mp3-fixed.zip
    unzip mp3-fixed.zip -d data

    rm mp3*
fi


mkdir -p wav
ls data/a/*.mp3 | xargs -P 10 -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'

echo "$0: Data downloaded successfully"

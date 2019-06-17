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

if ! [ -d wav ]; then
    nj=32
    mkdir -p wav
    ls data/a/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/b/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/c/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/d/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/e/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/f/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/0/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/1/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/2/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/3/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/4/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/5/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/6/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/7/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/8/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'
    ls data/9/*.mp3 | xargs -P $nj -I % sh -c 'f=`basename -s ".mp3" %`; ffmpeg -i % -acodec pcm_u8 -ar 16000 wav/$f.wav'

    # These files had errors
    rm wav/norine_braun-now_and_zen-08-gently-117-146.wav
    rm wav/american_baroque-dances_and_suites_of_rameau_and_couperin-25-le_petit_rien_xiveme_ordre_couperin-88-117.wav
fi

echo "$0: Data downloaded successfully"

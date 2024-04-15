#!/bin/env bash
#
# this scripts adds the downloaded workshop items to the server config
#######################

KF_SERVER_CONFIG=./data/KFGame/Config/LinuxServer-KFGame.ini
KF_SERVER_CACHE_DIR=./data/KFGame/Cache
CUSTOM_MAPS=($(find $KF_SERVER_CACHE_DIR -name '*.kfm'))

echo "Custom maps found: ${CUSTOM_MAPS[*]}"

add_map_to_server_config () {
    filename=$(basename -- "$1")
    extension="${filename##*.}"
    mapname="${filename%.*}"

    if grep -q $mapname "$KF_SERVER_CONFIG"; then
        echo "Map $mapname already exists"
    else
        echo "Adding map $mapname"

        echo "" >> $KF_SERVER_CONFIG
        echo "" >> $KF_SERVER_CONFIG
        echo "[$mapname KFMapSummary]" >> $KF_SERVER_CONFIG
        echo "MapName=$mapname" >> $KF_SERVER_CONFIG
    fi
}

add_maps(){
    for i in "${CUSTOM_MAPS[@]}"
    do
        add_map_to_server_config $i
    done
}

add_maps
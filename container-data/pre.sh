#!/usr/bin/env bash

# Replace all '\' with '/' in "/data/KFGame/Config/LinuxServer-KFEngine.ini"
sed -i 's/\\/\//g' "/data/KFGame/Config/LinuxServer-KFEngine.ini"

# Apply the env to ini mapping
"$USER_HOME"/envini "$USER_HOME"/envini_mapping.ini

# Add custom maps to server config
./configure_custom_maps.sh
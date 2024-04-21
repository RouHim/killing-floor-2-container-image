#!/usr/bin/env bash

KF_ENGINE="$SERVER_DIR/KFGame/Config/LinuxServer-KFEngine.ini"

# Replace all '\' with '/'
sed -i 's/\\/\//g' "$KF_ENGINE"

# Apply the env to ini mapping
"$USER_HOME"/envini "$USER_HOME"/envini_mapping.ini

# Add custom maps to server config
"$USER_HOME"/configure_custom_maps.sh

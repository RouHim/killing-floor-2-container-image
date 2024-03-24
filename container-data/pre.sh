#!/usr/bin/env bash
# shellcheck disable=SC2086
# shellcheck disable=SC2164

# Constants
KF_GAME_INI=KFGame/Config/LinuxServer-KFGame.ini
KF_ENGINE_INI=KFGame/Config/LinuxServer-KFEngine.ini


echo "##################"

mv $USER_HOME/KF2ServerToolCMD $SERVER_DIR/KF2ServerToolCMD
mv $USER_HOME/KFServerToolCMD.ini $SERVER_DIR/KFServerToolCMD.ini
cd $SERVER_DIR
./KF2ServerToolCMD -info

echo "##################"

echo "Setting up KF2_WEB_ADMIN_ENABLED: $KF2_WEB_ADMIN_ENABLED"

if [ "$KF2_WEB_ADMIN_ENABLED" == "true" ]; then
  echo "Enabling web admin"
  ./KF2ServerToolCMD -webadmin on
else
  echo "Disabling web admin"
  ./KF2ServerToolCMD -webadmin off
fi

# Set AdminPassword in KF_GAME_INI
sed -i -e "s/^\(AdminPassword=\).*/\1$KF2_WEB_ADMIN_PASSWORD/" $KF_GAME_INI

echo "##################"

echo "Installing custom maps: $KF2_CUSTOM_MAPS"
for map in ${KF2_CUSTOM_MAPS//,/ }
do
  echo "Installing map: $map"
  ./KF2ServerToolCMD -addmap $map
done

echo "##################"

echo "Installing custom mutators: $KF2_MODS"
for mod in ${KF2_MODS//,/ }
do
  echo "Installing mutator: $mod"
  ./KF2ServerToolCMD -addmod $mod
done

echo "##################"
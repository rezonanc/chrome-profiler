#!/bin/bash

USER_PROFILES_PATH=`realpath ~/profiles/`
SCRIPT_NAME='rebuild_profile_links.sh'
PKG_NAME='chrome-profiler'

# Check if profiles directory exists
if [ ! -d ${USER_PROFILES_PATH} ]
then
    mkdir ${USER_PROFILES_PATH}
fi

# Install profile links rebuilder (overwrite the old one if necessary)
cp /usr/share/${PKG_NAME}/${SCRIPT_NAME} ${USER_PROFILES_PATH}/

# Give proper permissions
chmod 755 ${USER_PROFILES_PATH}/${SCRIPT_NAME}

#!/bin/bash

# Check if an argument is passed
if [ $# -lt 1 ]
then
    echo "Usage: $0 profile_name [URL]"
    exit 1
fi

PROFILE_NAME="$1"
URL="$2"
PROFILES_PATH=`realpath ~/profiles/`
PROFILE_PATH="${PROFILES_PATH}/${PROFILE_NAME}/"

# Check if profile is available
if [ ! -d "${PROFILE_PATH}" ]
then
    echo "No profile found at: ${PROFILE_PATH}"
    exit 1
fi

# Execute chrome with specified profile
google-chrome-stable --disable-sync-preferences --user-data-dir=${PROFILE_PATH} ${URL}

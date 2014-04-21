#!/bin/bash

# Check if an argument is passed
if [ $# -lt 1 ]
then
    echo "Usage: $0 profile_name"
    exit 1
fi

PROFILE_NAME="$1"
PROFILES_PATH=`realpath ~/profiles/`
PROFILE_PATH="${PROFILES_PATH}/${PROFILE_NAME}/"
PROFILE_TEMPLATE_PATH="${PROFILES_PATH}/template_"

# Check if profile template exists
if [ ! -d "${PROFILE_TEMPLATE_PATH}" ]
then
    echo "There is no profile template at: ${PROFILE_TEMPLATE_PATH}, please create one."
    exit 1
fi

# Check if profile is already available
if [ -d "${PROFILE_PATH}" ]
then
    echo "A profile already exists: ${PROFILE_PATH}"
    exit 1
fi

# Create new profile based on template
cp -r ${PROFILE_TEMPLATE_PATH} ${PROFILE_PATH}

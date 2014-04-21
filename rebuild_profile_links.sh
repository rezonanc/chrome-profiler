#!/bin/bash

PROFILES_PATH=`realpath ~/profiles/`/
OUTPUT_PATH='/usr/local/bin'

# Delete old links
sudo rm /usr/local/bin/chrome-*

# Collect all available profiles
PROFILES=`ls -hF ${PROFILES_PATH}  | egrep -v '_/$' | egrep '/$' | sed 's|/$||' `

# Prepare a template script
PROFILE_TEMPLATE=$(cat <<'END_HEREDOC'
#!/bin/bash

chrome-profile PROFILE_NAME
END_HEREDOC
)

# Cycle through each profile
for PROFILE in $PROFILES
do
    PROFILE_FN="${OUTPUT_PATH}/chrome-profile-${PROFILE}.sh"

    # Update the template script (replace 'PROFILE_NAME' => $PROFILE)
    UPDATED_PROFILE_TEMPLATE=${PROFILE_TEMPLATE/PROFILE_NAME/$PROFILE}

    # Output the result
    sudo sh -c "echo -e \"${UPDATED_PROFILE_TEMPLATE}\" > $PROFILE_FN"

    # Allow to execute it
    sudo sh -c "chmod +x $PROFILE_FN"
done

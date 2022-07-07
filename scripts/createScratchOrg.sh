#!/bin/bash

DEV_HUB_ALIAS="vikaskumar171020@wise-unicorn-51gmzk.com"    #your username
SCRATCH_ORG_ALIAS="TrailHeadOrg"               #your scratch org name
# PACKAGENAME="stripe cyntexa"                    #package name


echo "set default devhub user :" $DEV_HUB_ALIAS
sfdx force:config:set defaultdevhubusername=$DEV_HUB_ALIAS

echo "deleting old scratch org :" $SCRATCH_ORG_ALIAS
sfdx force:org:delete -p -u $SCRATCH_ORG_ALIAS
rm -rf ./.sfdx/orgs

echo "Creating scratch ORG..."
sfdx force:org:create -a $SCRATCH_ORG_ALIAS -s -f ./config/project-scratch-def.json -d 30

echo "Pushing changes to scratch org..."
sfdx force:source:push

# echo "Assigning Admin permission set to running user."
# sfdx force:user:permset:assign --permsetname ChargeOn_Admin --targetusername $SCRATCH_ORG_ALIAS

# echo "Assigning permission"
# execute sfdx force:user:permset:assign -n {Permission Set}

# echo "Make sure Org user is english"
# sfdx force:data:record:update -s User -w "Name='User User'" -v "Languagelocalekey=en_US"

# echo "Running apex tests..."
# execute sfdx force:apex:test:run -l RunLocalTests -w 30


# if [ -f "package.json" ]; then
#   echo "Running jest tests"
#   execute npm install
#   execute npm run test:unit
# fi


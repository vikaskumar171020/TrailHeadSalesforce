#!/bin/bash

DEV_HUB_ALIAS="vikaskumar171020@wise-unicorn-51gmzk.com"    #your username
SCRATCH_ORG_ALIAS="TrailHeadOrg"               #your scratch org name


echo "set default devhub user :" $DEV_HUB_ALIAS
sfdx force:config:set defaultdevhubusername=$DEV_HUB_ALIAS

echo "deleting old scratch org :" $SCRATCH_ORG_ALIAS
sfdx force:org:delete -p -u $SCRATCH_ORG_ALIAS
rm -rf ./.sfdx/orgs

echo "Creating scratch ORG..."
sfdx force:org:create -a $SCRATCH_ORG_ALIAS -s -f ./config/project-scratch-def.json -d 30

echo "Pushing changes to scratch org..."
sfdx force:source:push
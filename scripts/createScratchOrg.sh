#!/bin/bash

DEV_HUB_ALIAS=""    #your username
SCRATCH_ORG_ALIAS=""    #your scratch org name


echo "set default devhub user :" $DEV_HUB_ALIAS
sfdx force:config:set defaultdevhubusername=$DEV_HUB_ALIAS

echo "deleting old scratch org :" $SCRATCH_ORG_ALIAS
sfdx force:org:delete -p -u $SCRATCH_ORG_ALIAS
rm -rf ./.sfdx/orgs

echo "Creating scratch org..."
sfdx force:org:create -a $SCRATCH_ORG_ALIAS -s -f ./config/project-scratch-def.json -d 30

echo "Pushing changes to scratch org..."
sfdx force:source:push -f

echo "Pulling changes from scratch org..."
sfdx force:source:pull

echo "Generating Password for org :" $SCRATCH_ORG_ALIAS
sfdx force:user:password:generate -u $SCRATCH_ORG_ALIAS

echo "Getting Password from org :" $SCRATCH_ORG_ALIAS
sfdx force:user:display -u $SCRATCH_ORG_ALIAS --json > ../user.txt

# this is use to create a new scratchorg and delete old scratch org
# !bin/bash
DEV_HUB_ALIAS="vikaskumar171020@wise-unicorn-51gmzk.com"
SCRATCH_ORG_ALIAS="TrailHeadOrg"

echo "set default dev hub user:" $DEV_HUB_ALIAS
sfdx force:config:set defaultdevhubusername=$DEV_HUB_ALIAS

echo "deleting old scratch org:" $SCRATCH_ORG_ALIAS
sfdx force:org:delete -p -u $scratch_org_alias

echo "creating new scratch org..."
sfdx force:org:create -a $scratch_org_alias -s -f ./config/project-scratch-def.json -d 30

echo "pushing changes to scratch org..."
sfdx force:source:push
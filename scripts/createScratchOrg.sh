# this is use to create a new scratchorg and delete old scratch org
# !bin/bash
dev_hub_alias = "vikaskumar171020@wise-unicorn-51gmzk.com"
scratch_org_alias = "TrailHeadOrg"

echo "set default dev hub user:" $dev_hub_alias
sfdx force:config:set defaultdevhubusername = $dev_hub_alias

echo "deleting old scratch org:"$scratch_org_alias
sfdx force:org:delete -p -u $scratch_org_alias

echo "creating new scratch org..."
sfdx force:org:create -a $scratch_org_alias -s -f ./config/project-scratch-def.json -d 30

echo "pushing changes to scratch org..."
sfdx force:source:push
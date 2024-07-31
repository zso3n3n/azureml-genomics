az account set --subscription $SUBSCRIPTION_ID # replace with your subscription name
az configure --defaults group=$RESOURCE_GROUP workspace=$WORKSPACE_NAME

az ml job create -f pipeline.yml
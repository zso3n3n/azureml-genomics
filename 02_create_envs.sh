az account set --subscription $SUBSCRIPTION_ID # replace with your subscription name
az configure --defaults group=$RESOURCE_GROUP workspace=$WORKSPACE_NAME

az ml environment create -f ./environments/bwa-env/env.yml
az ml environment create -f ./environments/fastqc-env/env.yml
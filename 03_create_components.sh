az account set --subscription $SUBSCRIPTION_ID # replace with your subscription name
az configure --defaults group=$RESOURCE_GROUP workspace=$WORKSPACE_NAME

az ml component create -f ./components/bwa_index/bwa_index.yml
az ml component create -f ./components/bwa/bwa.yml
az ml component create -f ./components/fastqc/fastqc.yml
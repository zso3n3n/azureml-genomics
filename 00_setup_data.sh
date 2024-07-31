source .env

mkdir data
(cd data ; fastq-dl --accession DRS259711)

az account set --subscription $SUBSCRIPTION_ID # replace with your subscription name
az configure --defaults group=$RESOURCE_GROUP workspace=$WORKSPACE_NAME
az ml data create -f data_assets/hg38.yml
az ml data create -f data_assets/genomic_data.yml

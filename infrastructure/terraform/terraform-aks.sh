#!/bin/bash

# Run Azure CLI
sudo snap install docker
sudo docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh mcr.microsoft.com/azure-cli:2.6.0

#login and follow prompts
az login
export TENANT_ID=$(az account show | jq -r '.tenantId')
export TENTANT_ID=ae5991f4-c026-4f47-abcf-533d593d9e62

# view and select your subscription account

az account list -o table
export SUBSCRIPTION=ad2c6380-a5fc-488d-821a-d8f762d65c3b
az account set --subscription $SUBSCRIPTION

#install aks cluster
az aks create --resource-group petstore --location ukwest --name petstoreCluster --node-count 3 --enable-addons monitoring --generate-ssh-keys
az aks get-credentials --resource-group petsore --name petstoreCluster 

#creating service principal
SERVICE_PRINCIPAL_JSON=$(az ad sp create-for-rbac --skip-assignment --name petstore_service_principal -o json)


#terraform
terraform init

terraform plan -var serviceprinciple_id=$SERVICE_PRINCIPAL \
    -var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
    -var tenant_id=$TENTANT_ID \
    -var subscription_id=$SUBSCRIPTION \
    -var ssh_key="$SSH_KEY"

terraform apply -var serviceprinciple_id=$SERVICE_PRINCIPAL \
    -var serviceprinciple_key="$SERVICE_PRINCIPAL_SECRET" \
    -var tenant_id=$TENTANT_ID \
    -var subscription_id=$SUBSCRIPTION \
    -var ssh_key="$SSH_KEY"
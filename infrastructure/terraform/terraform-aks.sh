#!/bin/bash
az aks get-credentials --resource-group pet-clinic --name pet-clinic-cluster
# Run Azure CLI
# sudo snap install docker
# sudo docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh mcr.microsoft.com/azure-cli:2.6.0

# #login and follow prompts
# az login
sudo apt  install jq
#export TENANT_ID="$(az account show | jq -r '.tenantId')"

# view and select your subscription account

az account list -o table
#export SUBSCRIPTION="$(az account show -o json | jq -r '.id')"

echo "SETTING ACCOUNT"
az account set --subscription ${serviceprincipalsubscription}


#creating service principal
#SERVICE_PRINCIPAL_JSON="$(az ad sp create-for-rbac --skip-assignment --name petstore_service_principal -o json)"

# Keep the `appId` and `password` for later use!
#export SERVICE_PRINCIPAL="$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.appId')"
#export SERVICE_PRINCIPAL_SECRET="$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.password')"

# Grant contributor role over the subscription to our service principal
echo "SETTING ROLE ASSIGNMENT"
az role assignment create --assignee ${serviceprincipalclientid} \
--scope "/subscriptions/${serviceprincipalsubscription}" \
--role Contributor

#terraform CLI - perhaps remove but it makes more sense to remove from jenkins script and add it to this script. But also may not matter whatsoever
# sudo apt install -y unzip wget
# wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
# unzip terraform_*_linux_*.zip
# sudo mv terraform /usr/local/bin/
# rm terraform_*_linux_*.zip
echo "CDing into terraform folder"
cd 
cd /pet-store/infrastructure/terraform

#generate SSH key

echo "GENERATING SSH SCRIPT"
ssh-keygen -t rsa -b 4096 -N "" -q -f ~/.ssh/id_rsa -y
SSH_KEY=$(cat ~/.ssh/id_rsa.pub)

#terraform
terraform init

terraform plan -var serviceprinciple_id=${serviceprincipalclientid} \
    -var serviceprinciple_key=${serviceprincipalpassword} \
    -var tenant_id=${serviceprincipaltenant} \
    -var subscription_id=${serviceprincipalsubscription} \
    -var ssh_key="$SSH_KEY"

terraform apply --auto-approve -var serviceprinciple_id=${serviceprincipalclientid} \
    -var serviceprinciple_key=${serviceprincipalpassword} \
    -var tenant_id=${serviceprincipaltenant} \
    -var subscription_id=${serviceprincipalsubscription} \
    -var ssh_key="$SSH_KEY"
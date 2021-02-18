provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.serviceprinciple_id
  client_secret   = var.serviceprinciple_key
  tenant_id       = var.tenant_id
    features{}
}

module "cluster" {
  source                = "./modules/cluster/"
  name                  = var.name
  serviceprinciple_id   = var.serviceprinciple_id
  serviceprinciple_key  = var.serviceprinciple_key
  ssh_key               = var.ssh_key
  location              = var.location
  kubernetes_version    = var.kubernetes_version  
  resource_group        = var.resource_group
}

#module "k8s" {
#    source = "./modules/k8s/"
#  host                  = "${module.cluster.host}"
#  client_certificate    = "${base64decode(module.cluster.client_certificate)}"
#  client_key            = "${base64decode(module.cluster.client_key)}"
#  cluster_ca_certificate= "${base64decode(module.cluster.cluster_ca_certificate)}"  
#}

module "virtual_network" {
  source = "./modules/vnet"
  resource_group = var.name
  location = var.location
  project_name = var.project_name
}

module "sql" {
  source = "./modules/sql"
  resource_group = var.name
  location = var.location
  project_name = var.project_name
  administrator_login = var.adminlogin
  administrator_login_password = var.adminpassword
}
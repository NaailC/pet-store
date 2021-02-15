#local variables 
variable "name" {
  default ="kubecluster"
}

#passed variables 
variable "location" {}
variable "kubernetes_version" {}
variable "serviceprinciple_id" {}
variable "serviceprinciple_key" {}
variable "ssh_key" {}
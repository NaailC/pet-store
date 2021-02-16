#local variables 
variable "name" {
  default = "petstore"
}

variable "location" {
  default = "uksouth"
}

#passed variables 
variable "kubernetes_version" {}
variable "serviceprinciple_id" {}
variable "serviceprinciple_key" {}
variable "ssh_key" {}
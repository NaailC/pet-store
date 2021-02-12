#local variables 
variable "name" {
  default ="kubecluster"
}
variable "location" {
  default = "uksouth"
  
}
variable "kubernetes_version" {}
#passed variables 

variable "serviceprinciple_id" {}
variable "serviceprinciple_key" {}
variable "ssh_key" {}
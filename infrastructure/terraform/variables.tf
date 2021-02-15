variable "serviceprinciple_id" {
  default = 
}

variable "serviceprinciple_key" {
  default = 
}

variable "tenant_id" {
 default = 
}

variable "subscription_id" {
  default = 
}

// SSH Key Variable
variable "ssh_key" {
  default = 
}

// Location
variable "location" {
  default = "UKsouth"
}

// Kubernetes
variable "kubernetes_version" {
    default = "1.18.14"
}

// VM Size
variable "vm_size" {
    default = "Standard_E2s"
}
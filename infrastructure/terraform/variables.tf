variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}

variable "name" {
  default = "pet-clinic"
}

variable "project_name" {
  default = "pet-clinic"
}

variable "resource_group" {
  default = "pet-clinic"
}

// SSH Key Variable - may need to not write this as an env var
variable "ssh_key" {
}

// Location
variable "location" {
  default = "ukwest"
}

// Kubernetes
variable "kubernetes_version" {
    default = "1.18.14"
}

// VM Size - may need to change
variable "vm_size" {
    default = "Standard_E2s"
}
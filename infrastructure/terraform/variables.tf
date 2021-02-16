variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}

variable "name" {
  default = "petstore"
}

variable "project_name" {
  default = "petstore"
}

// SSH Key Variable - may need to not write this as an env var
variable "ssh_key" {
}

// Location
variable "location" {
  default = "UKsouth"
}

// Kubernetes
variable "kubernetes_version" {
    default = "1.18.14"
}

// VM Size - may need to change
variable "vm_size" {
    default = "Standard_E2s"
}
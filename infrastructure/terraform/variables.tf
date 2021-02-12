variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}

// SSH Key Variable
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

// VM Size
variable "vm_size" {
    default = "Standard_E2s"
}
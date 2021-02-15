variable "serviceprinciple_id" {
  default = "${SERVICE_PRINCIPAL}"
}

variable "serviceprinciple_key" {
  default = "${SERVICE_PRINCIPAL_SECRET}" 
}

variable "tenant_id" {
 default = "${TENTANT_ID}"
}

variable "subscription_id" {
  default = "${SUBSCRIPTION}"
}

// SSH Key Variable
variable "ssh_key" {
  default = "${SSH_KEY}"
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
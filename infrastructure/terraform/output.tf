// k8s cluster

output "k8scluster" {
    value = backend.k8s.kubernetes_deployment
}

output "loadbalancer" {
    value = frontend.k8s.kubernetes_service
}

// cluster

output "kube_config" {
    value = azurerm_kubernetes_cluster.kubecluster.kube_config_raw  
}

output "cluster_ca_certificate" {
     value = azurerm_kubernetes_cluster.kubecluster.kube_config.0.cluster_ca_certificate  
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.kubecluster.kube_config.0.client_certificate
}

output "client_key" {
    value = azurerm_kubernetes_cluster.kubecluster.kube_config.0.client_key
}

output "host" {
    value = azurerm_kubernetes_cluster.kubecluster.kube_config.0.host
}
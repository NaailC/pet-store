output "k8scluster" {
    value = backend.k8s.kubernetes_deployment
}

output "loadbalancer" {
    value = frontend.k8s.kubernetes_service
}
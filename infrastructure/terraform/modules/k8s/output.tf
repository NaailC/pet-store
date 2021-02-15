output "k8scluster" {
    value = backend.k8s.kubernetes_deployment
}

output "loadbalancer" {
    value = kubernetes_nginx.k8s.kubernetes_nginx
}
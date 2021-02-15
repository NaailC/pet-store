provider "kubernetes" {
  config_path    = "~/.kube/config"
    host                   =  var.host
    client_certificate     =  var.client_certificate
    client_key             =  var.client_key
    cluster_ca_certificate =  var.cluster_ca_certificate
}


resource "kubernetes_deployment" "backend" {
  metadata {
    name = "${var.project-name}"
    labels = {
      test = "petstore"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "petstore"
      }
    }

    template {
      metadata {
        labels = {
          test = "petstore"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"


          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "${var.project-name}"
  }
  spec {
    selector = {
      test = "petstore"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
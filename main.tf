module "label" {
  source = "github.com/robc-io/terraform-null-label.git?ref=0.16.1"
  tags = {
    NetworkName = var.network_name
    Owner       = var.owner
    Terraform   = true
    VpcType     = "main"
  }

  environment = var.environment
  namespace   = var.namespace
  stage       = var.stage
}

resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.location

  network    = var.vpc_id
  subnetwork = var.subnet_id

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "this" {
  name       = "${var.cluster_name}-workers"
  location   = var.location
  cluster    = google_container_cluster.this.name
  node_count = var.cluster_autoscale ? null : var.num_workers
  version    = var.k8s_version

  dynamic "autoscaling" {
    for_each = var.cluster_autoscale ? [1] : []
    content {
      max_node_count = var.cluster_autoscale_max_workers
      min_node_count = var.cluster_autoscale_min_workers
    }
  }

  node_config {
    preemptible  = true
    machine_type = var.worker_instance_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

data "template_file" "kubeconfig" {
  template = file("${path.module}/gke_kubeconfig-template.yaml")

  vars = {
    cluster_name    = google_container_cluster.this.name
    endpoint        = google_container_cluster.this.endpoint
    user_name       = google_container_cluster.this.master_auth.0.username
    user_password   = google_container_cluster.this.master_auth.0.password
    cluster_ca      = google_container_cluster.this.master_auth.0.cluster_ca_certificate
    client_cert     = google_container_cluster.this.master_auth.0.client_certificate
    client_cert_key = google_container_cluster.this.master_auth.0.client_key
  }
}

resource "local_file" "kubeconfiggke" {
  content  = data.template_file.kubeconfig.rendered
  filename = "${path.module}/kubeconfig_gke"
}
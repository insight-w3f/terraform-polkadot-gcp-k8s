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

module "this" {
  source            = "terraform-google-modules/kubernetes-engine/google"
  ip_range_pods     = "eks-pods"
  ip_range_services = "eks-svcs"
  name              = var.cluster_name
  network           = var.vpc_name
  project_id        = var.project
  subnetwork        = "eks"
  region            = var.region

  node_pools = [
    {
      name         = "default-node-pool"
      autoscaling  = var.cluster_autoscale
      machine_type = var.worker_instance_type == "" ? null : var.worker_instance_type
      min_count    = var.cluster_autoscale_min_workers == 0 ? 1 : var.cluster_autoscale_min_workers
      max_count    = var.cluster_autoscale_max_workers == 0 ? 100 : var.cluster_autoscale_max_workers
    },
  ]
}

data "google_client_config" "this" {}

data "template_file" "kubeconfig" {
  template = file("${path.module}/gke_kubeconfig-template.yaml")

  vars = {
    cluster_name = module.this.name
    endpoint     = module.this.endpoint
    cluster_ca   = module.this.ca_certificate
    token        = data.google_client_config.this.access_token
  }
}

resource "local_file" "kubeconfiggke" {
  content  = data.template_file.kubeconfig.rendered
  filename = "${path.module}/kubeconfig_gke"
}
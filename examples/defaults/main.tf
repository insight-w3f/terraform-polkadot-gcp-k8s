provider "google" {}

variable "gcp_project" {}
variable "gcp_region" {}
variable "vpc_name" {
  default = "test"
}

module "network" {
  source   = "github.com/insight-w3f/terraform-polkadot-gcp-network.git"
  vpc_name = var.vpc_name
  project  = var.gcp_project
  region   = var.gcp_region
}

module "defaults" {
  source            = "../.."
  project           = var.gcp_project
  vpc_name          = module.network.public_vpc_name
  kubernetes_subnet = module.network.kubernetes_subnet
}

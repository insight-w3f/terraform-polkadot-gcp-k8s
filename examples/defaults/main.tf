provider "google" {}

variable "gcp_project" {}
variable "vpc_name" {
  default = "test"
}

module "network" {
  source   = "github.com/insight-w3f/terraform-polkadot-gcp-network.git"
  vpc_name = var.vpc_name
}

module "defaults" {
  source   = "../.."
  project  = var.gcp_project
  vpc_name = var.vpc_name
}

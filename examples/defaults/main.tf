provider "google" {}

module "network" {
  source = "github.com/insight-w3f/terraform-polkadot-gcp-network.git"
}

module "defaults" {
  source    = "../.."
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnets[0]
}

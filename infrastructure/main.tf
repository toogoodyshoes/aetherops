provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  zone_a = zone_a
}

module "compute" {
  source           = "./modules/compute"
  vpc_id           = module.network.vpc_id
  zone_a_subnet_id = module.network.zone_a_subnet_id
}
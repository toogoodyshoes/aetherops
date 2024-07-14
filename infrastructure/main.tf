provider "aws" {
  region  = var.region
  profile = var.profile
}

module "network" {
  source = "./modules/network"
  zone_a = var.zone_a
}

module "compute" {
  source                      = "./modules/compute"
  vpc_id                      = module.network.vpc_id
  zone_a_subnet_id            = module.network.zone_a_subnet_id
  zone_a_monitoring_subnet_id = module.network.zone_a_monitoring_subnet_id
}

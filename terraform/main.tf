module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  admin_cidr   = var.admin_cidr
}

module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  subnet_ids        = module.network.public_subnet_ids
  security_group_id = module.security.web_sg_id
  public_key        = file(pathexpand(var.ssh_public_key_path))
  repo_url = var.repo_url
}
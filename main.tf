module "network" {
  source      = "./modules/network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  aws_region  = var.aws_region
}

module "machines" {
  source             = "./modules/machines"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.network.subnet_id
  security_group_ids = [module.network.security_group_id]
  key_name           = var.key_name
  user_data          = file("deploy_jenkins.sh")
}
terraform {
  backend "s3" {
    key = "prod/terraform.tfstate"
  }
}

provider "aws" {
  region = var.provider_region
}

module "networking" {
  source = "../../modules/networking"

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  vpc_block           = var.vpc_block
  environment_tag     = var.environment_tag
}

module "security" {
  source = "../../modules/security"

  vpc_id          = module.networking.vpc_id
  environment_tag = var.environment_tag
  cidr_ipv4       = var.cidr_ipv4
}

module "compute" {
  source = "../../modules/compute"

  environment_tag  = var.environment_tag
  instance_type    = var.instance_type
  asg_desired_size = var.asg_desired_size
  asg_max_size     = var.asg_max_size
  asg_min_size     = var.asg_min_size
  key_name         = var.key_name

  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security.security_group_id
}

module "monitoring" {
  source = "../../modules/monitoring"

  environment_tag = var.environment_tag

  asg_name               = module.compute.asg_name
  cloudwatch_threshold   = var.cloudwatch_threshold
  cloudwatch_period      = var.cloudwatch_period
  cloudwatch_eval_period = var.cloudwatch_eval_period
}

module "ansible_inventory" {
  source = "../../modules/ansible_inventory"

  environment = var.environment_tag
  public_ips  = module.compute.asg_instance_public_ips

  inventory_path = abspath(
    "${path.root}/../../ansible/inventories/${var.environment_tag}/hosts.ini"
  )
}

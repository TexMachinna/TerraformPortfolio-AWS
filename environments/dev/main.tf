terraform {
  backend "s3" {
    key = "dev/terraform.tfstate"
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

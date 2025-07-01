terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "web" {
  source             = "./modules/web"
  public_subnet_id   = module.vpc.public_subnet_id
  web_sg_id          = module.security_groups.web_sg_id
}

module "app" {
  source             = "./modules/app"
  private_subnet_id  = module.vpc.private_subnet_id
  app_sg_id          = module.security_groups.app_sg_id
}

module "db" {
  source             = "./modules/db"
  private_subnet_id  = module.vpc.private_subnet_id
  db_sg_id           = module.security_groups.db_sg_id
}


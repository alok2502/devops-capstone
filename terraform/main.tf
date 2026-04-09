terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name          = var.project_name
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
}

module "ec2" {
  source        = "./modules/ec2"
  app_name      = var.project_name
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  instance_type = var.instance_type
}

output "server_ip" {
  value = module.ec2.instance_public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

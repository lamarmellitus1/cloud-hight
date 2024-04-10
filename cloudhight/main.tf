terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
  source                         = "../modules/vpc"
  vpc_cidr                       = var.vpc_cidr
  pri_sub_4b_cidr                = var.pri_sub_4b_cidr
  pri_sub_5a_cidr                = var.pri_sub_5a_cidr
  pri_sub_6b_cidr                = var.pri_sub_6b_cidr
  pub_sub_1a_cidr                = var.pub_sub_1a_cidr
  pub_sub_2b_cidr                = var.pub_sub_2b_cidr
  cloudhight-private_sub_3a_cidr = var.cloudhight-private_sub_3a_cidr
  project_name                   = var.project_name

}

module "NAT" {
  source        = "../modules/NAT"
  vpc_id        = module.vpc.vpc_id
  igw_id        = module.vpc.igw_id
  pri_sub_3a_id = module.vpc.pri_sub_3a_id
  pri_sub_4b_id = module.vpc.pri_sub_4b_id
  pri_sub_5a_id = module.vpc.pri_sub_5a_id
  pri_sub_6b_id = module.vpc.pri_sub_6b_id
  pub_sub_1a_id = module.vpc.pub_sub_1a_id
  pub_sub_2b_id = module.vpc.pub_sub_2b_id
}

module "security_groups" {
  source = "../modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "database" {
  source        = "../modules/database"
  pri_sub_5a_id = module.vpc.pri_sub_5a_id
  pri_sub_6b_id = module.vpc.pri_sub_6b_id
  db_sg_id      = module.security_groups.db_sg_id

}

module "ALB" {
  source        = "../modules/alb"
  project_name  = module.vpc.project_name
  pub_sub_1a_id = module.vpc.pub_sub_1a_id
  pub_sub_2b_id = module.vpc.pub_sub_2b_id
  vpc_id        = module.vpc.vpc_id
  alb_sg_id     = module.security_groups.alb_sg_id


}
module "key" {
  source = "../modules/key"
}

module "ASG" {
  source        = "../modules/asg"
  project_name  = module.vpc.project_name
  client_sg_id  = module.security_groups.client_sg_id.id
  pri_sub_3a_id = module.vpc.pri_sub_3a_id
  pri_sub_4b_id = module.vpc.pri_sub_4b_id
  tg_arn        = module.ALB.tg_arn
  key_name      = module.key.aws_key
}

module "jenkins" {
  source     = "../modules/jenkins"
  key_name   = module.key.aws_key
  sg_id      = module.security_groups.client_sg_id.id
  pub-sub-1a = module.vpc.pub_sub_1a_id
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.14"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  public_azs         = var.public_azs
  private_azs        = var.private_azs
  enable_nat_gateway = var.enable_nat_gateway
  tags               = var.tags
}

module "nacl" {
  source       = "./modules/nacl"
  vpc_id       = module.vpc.vpc_id
  allowed_cidr = var.allowed_cidr
  tags         = var.tags
}

module "security" {
  source            = "./modules/security"
  vpc_id            = module.vpc.vpc_id
  name_prefix       = var.name_prefix
  web_ingress_rules = var.web_ingress_rules
  app_ingress_rules = var.app_ingress_rules
  db_ingress_rules  = var.db_ingress_rules
  efs_ingress_rules = var.efs_ingress_rules
  tags              = var.tags
}

module "app_server" {
  source              = "./modules/app_server"
  app_instance_count  = var.app_instance_count
  app_ami_list        = var.app_ami_list
  app_instance_types  = var.app_instance_types
  app_instance_names  = var.app_instance_names
  app_sg_ids          = var.app_sg_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  name_prefix         = var.name_prefix
  tags                = var.tags
}

module "db" {
  source                   = "./modules/db"
  mysql_ami                = var.mysql_ami
  mysql_instance_type_list = var.mysql_instance_type_list
  postgres_ami             = var.postgres_ami
  postgres_instance_type   = var.postgres_instance_type
  mysql_sg_ids             = var.mysql_sg_ids
  postgres_sg_ids          = var.postgres_sg_ids
  private_subnet_ids       = module.vpc.private_subnet_ids
  name_prefix              = var.name_prefix
  tags                     = var.tags
}

module "web_server" {
  source              = "./modules/web_server"
  web_instance_count  = var.web_instance_count
  web_ami_list        = var.web_ami_list
  web_instance_types  = var.web_instance_types
  web_instance_names  = var.web_instance_names
  web_sg_ids          = var.web_sg_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  name_prefix         = var.name_prefix
  tags                = var.tags
}

module "public_server" {
  source                 = "./modules/public_server"
  public_instance_count  = var.public_instance_count
  public_ami_list        = var.public_ami_list
  public_instance_types  = var.public_instance_types
  public_instance_names  = var.public_instance_names
  public_sg_ids          = var.public_sg_ids
  public_subnet_ids      = module.vpc.public_subnet_ids
  name_prefix            = var.name_prefix
  tags                   = var.tags
}

module "alb" {
  source                = "./modules/alb"
  name_prefix           = var.name_prefix
  public_subnet_ids     = module.vpc.public_subnet_ids
  vpc_id                = module.vpc.vpc_id
  alb_sg_id             = module.security.web_sg_id
  alb_target_port       = var.alb_target_port
  alb_target_protocol   = var.alb_target_protocol
  alb_listener_port     = var.alb_listener_port
  alb_listener_protocol = var.alb_listener_protocol
  alb_health_check_path = var.alb_health_check_path
  tags                  = var.tags
}

module "efs" {
  source             = "./modules/efs"
  creation_token     = var.efs_creation_token
  private_subnet_ids = module.vpc.private_subnet_ids
  efs_sg_id          = module.security.efs_sg_id
  name_prefix        = var.name_prefix
  tags               = var.tags
}

module "rds" {
  source                  = "./modules/rds"
  environment             = var.environment
  name_prefix             = var.name_prefix
  mysql_engine_version    = var.mysql_engine_version
  mysql_instance_class    = var.mysql_instance_class
  mysql_allocated_storage = var.mysql_allocated_storage
  mysql_storage_type      = var.mysql_storage_type
  mysql_username          = var.mysql_username
  mysql_password          = var.mysql_password
  private_subnet_ids      = module.vpc.private_subnet_ids
  db_sg_id                = module.security.db_sg_id
  tags                    = var.tags
}

module "backup" {
  source                = "./modules/backup"
  name_prefix           = var.name_prefix
  backup_schedule       = var.backup_schedule
  backup_retention_days = var.backup_retention_days
  backup_role_arn       = var.backup_role_arn
  tags                  = var.tags
}

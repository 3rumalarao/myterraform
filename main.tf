terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "./modules/vpc"
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  azs              = var.azs
  enable_flow_logs = var.enable_vpc_flow_logs
  dhcp_options     = var.dynamic_dhcp_options
  common_tags      = var.common_tags
}

module "ec2_private" {
  source           = "./modules/ec2"
  for_each         = var.private_servers
  instance_config  = each.value
  instance_count   = 1
  subnet_ids       = module.vpc.private_subnet_ids
  iam_role         = var.iam_role
  assign_public_ip = false
  common_tags      = var.common_tags
}

module "ec2_applications" {
  source           = "./modules/ec2"
  for_each         = var.applications
  instance_config  = each.value
  instance_count   = 2    # One per AZ
  subnet_ids       = module.vpc.private_subnet_ids
  iam_role         = var.iam_role
  assign_public_ip = false
  common_tags      = var.common_tags
}

module "ec2_public" {
  source           = "./modules/ec2"
  for_each         = var.public_instances
  instance_config  = each.value
  instance_count   = 1
  subnet_ids       = module.vpc.public_subnet_ids
  iam_role         = var.iam_role
  assign_public_ip = true
  common_tags      = var.common_tags
}

module "alb" {
  source         = "./modules/alb"
  for_each       = var.applications
  app_name       = each.key
  domain_name    = each.value.domain_name
  subnet_ids     = module.vpc.public_subnet_ids
  vpc_id         = module.vpc.vpc_id
  security_groups = each.value.security_groups
  route53_zone_id = var.route53_zone_id
  common_tags    = var.common_tags
}

module "efs" {
  source             = "./modules/efs"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  performance_mode   = var.efs_performance_mode
  encrypted          = var.efs_encrypted
  mount_points       = var.efs_mount_points
  security_groups    = var.efs_security_groups
  common_tags        = var.common_tags
}

module "rds" {
  source              = "./modules/rds"
  create_rds          = var.create_rds
  db_subnet_ids       = module.vpc.private_subnet_ids
  security_group_ids  = var.rds_security_groups
  engine              = "mysql"
  engine_version      = var.rds_engine_version
  instance_class      = var.rds_instance_class
  allocated_storage   = var.rds_allocated_storage
  username            = var.rds_username
  password            = var.rds_password
  db_name             = var.rds_db_name
  multi_az            = var.rds_multi_az
  common_tags         = var.common_tags
}

module "backup" {
  source            = "./modules/backup"
  create_snapshots  = var.create_snapshots
  instance_ids      = concat(
    flatten([for k, v in module.ec2_private.instance_ids : v]),
    flatten([for k, v in module.ec2_applications.instance_ids : v]),
    flatten([for k, v in module.ec2_public.instance_ids : v])
  )
  retention_days    = var.snapshot_retention_days
  backup_vault_name = var.backup_vault_name
  backup_role_arn   = var.backup_role_arn
}

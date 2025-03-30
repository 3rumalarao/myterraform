output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "efs_id" {
  value = module.efs.efs_id
}

output "rds_mysql_endpoint" {
  value = module.rds.rds_mysql_endpoint
}

output "backup_vault_name" {
  value = module.backup.backup_vault_name
}

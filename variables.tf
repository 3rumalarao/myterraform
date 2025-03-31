variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "enable_vpc_flow_logs" {
  type = bool
}

variable "dynamic_dhcp_options" {
  type = object({
    domain_name         = string,
    domain_name_servers = list(string)
  })
}

variable "common_tags" {
  type = map(string)
}

variable "iam_role" {
  type = string
}

variable "private_servers" {
  type = map(object({
    name            = string,
    ami             = list(string),
    instance_type   = string,
    security_groups = list(string),
    key_name        = string
  }))
}

variable "applications" {
  type = map(object({
    name            = string,
    ami             = list(string),
    instance_type   = string,
    security_groups = list(string),
    domain_name     = string,
    key_name        = string
  }))
}

variable "public_instances" {
  type = map(object({
    name            = string,
    ami             = list(string),
    instance_type   = string,
    security_groups = list(string),
    key_name        = string
  }))
}

variable "route53_zone_id" {
  type = string
}

variable "efs_performance_mode" {
  type = string
}

variable "efs_encrypted" {
  type = bool
}

variable "efs_mount_points" {
  type = list(string)
}

variable "efs_security_groups" {
  type = list(string)
}

variable "rds_security_groups" {
  type = list(string)
}

variable "rds_engine_version" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "rds_allocated_storage" {
  type = number
}

variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}

variable "rds_db_name" {
  type = string
}

variable "rds_multi_az" {
  type = bool
}

variable "create_rds" {
  type = bool
}

variable "create_snapshots" {
  type = bool
}

variable "snapshot_retention_days" {
  type = number
}

variable "backup_vault_name" {
  type = string
}

variable "backup_role_arn" {
  type = string
}

variable "mysql_ami" {
  description = "AMI for MySQL instance"
  type        = string
}

variable "mysql_instance_type_list" {
  description = "List of instance types for MySQL (if more than one)"
  type        = list(string)
}

variable "postgres_ami" {
  description = "AMI for PostgreSQL instance"
  type        = string
}

variable "postgres_instance_type" {
  description = "Instance type for PostgreSQL instance"
  type        = string
}

variable "mysql_sg_ids" {
  description = "List of security group IDs for the MySQL instance"
  type        = list(string)
}

variable "postgres_sg_ids" {
  description = "List of security group IDs for the PostgreSQL instance"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}

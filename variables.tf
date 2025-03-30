variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_azs" {
  description = "List of public Availability Zones"
  type        = list(string)
}

variable "private_azs" {
  description = "List of private Availability Zones"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "allowed_cidr" {
  description = "Allowed CIDR for NACL ingress (private)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {}
}

variable "web_ingress_rules" {
  description = "Ingress rules for the web security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "app_ingress_rules" {
  description = "Ingress rules for the app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "db_ingress_rules" {
  description = "Ingress rules for the db security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow MySQL"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      description = "Allow PostgreSQL"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
}

variable "efs_ingress_rules" {
  description = "Ingress rules for the EFS security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow NFS"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
}

variable "app_instance_count" {
  description = "Number of application instances"
  type        = number
  default     = 2
}

variable "app_ami" {
  description = "AMI for application servers"
  type        = string
}

variable "app_instance_type" {
  description = "Instance type for application servers"
  type        = string
}

variable "mysql_ami" {
  description = "AMI for MySQL instance"
  type        = string
}

variable "mysql_instance_type" {
  description = "Instance type for MySQL instance"
  type        = string
}

variable "postgres_ami" {
  description = "AMI for PostgreSQL instance"
  type        = string
}

variable "postgres_instance_type" {
  description = "Instance type for PostgreSQL instance"
  type        = string
}

variable "web_instance_count" {
  description = "Number of web server instances"
  type        = number
  default     = 1
}

variable "web_ami" {
  description = "AMI for web servers"
  type        = string
}

variable "web_instance_type" {
  description = "Instance type for web servers"
  type        = string
}

variable "public_instance_count" {
  description = "Number of public server instances"
  type        = number
  default     = 2
}

variable "public_ami" {
  description = "AMI for public servers"
  type        = string
}

variable "public_instance_type" {
  description = "Instance type for public servers"
  type        = string
}

variable "alb_target_port" {
  description = "ALB target group port"
  type        = number
  default     = 80
}

variable "alb_target_protocol" {
  description = "ALB target group protocol"
  type        = string
  default     = "HTTP"
}

variable "alb_listener_port" {
  description = "ALB listener port"
  type        = number
  default     = 80
}

variable "alb_listener_protocol" {
  description = "ALB listener protocol"
  type        = string
  default     = "HTTP"
}

variable "alb_health_check_path" {
  description = "ALB health check path"
  type        = string
  default     = "/"
}

variable "efs_creation_token" {
  description = "Creation token for EFS"
  type        = string
}

variable "mysql_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "mysql_instance_class" {
  description = "RDS MySQL instance class"
  type        = string
}

variable "mysql_allocated_storage" {
  description = "Allocated storage for RDS MySQL"
  type        = number
}

variable "mysql_storage_type" {
  description = "Storage type for RDS MySQL"
  type        = string
  default     = "gp2"
}

variable "mysql_username" {
  description = "RDS MySQL master username"
  type        = string
}

variable "mysql_password" {
  description = "RDS MySQL master password"
  type        = string
  sensitive   = true
}

variable "backup_schedule" {
  description = "Cron schedule for backups"
  type        = string
  default     = "cron(0 5 * * ? *)"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_role_arn" {
  description = "IAM Role ARN for AWS Backup"
  type        = string
}

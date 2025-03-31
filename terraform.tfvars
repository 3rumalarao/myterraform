aws_region = "us-east-1"
vpc_cidr   = "10.0.0.0/16"
vpc_name   = "custom-vpc"

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

public_azs  = ["us-east-1a", "us-east-1b"]
private_azs = ["us-east-1a", "us-east-1b"]

enable_nat_gateway = true
allowed_cidr       = "0.0.0.0/0"
name_prefix        = "myproject"
environment        = "prod"

tags = {
  Project     = "MyAWSProject"
  Environment = "prod"
}

# Application Server Variables
app_instance_count = 2
app_ami_list       = ["ami-app-12345678", "ami-app-87654321"]
app_instance_types = ["t3.micro", "t3.small"]
app_instance_names = ["myproject-app-1", "myproject-app-2"]
app_sg_ids         = [
  ["sg-app-11111111", "sg-app-22222222"],
  ["sg-app-33333333", "sg-app-44444444"]
]

# Database Instance Variables
mysql_ami                = "ami-db-12345678"
mysql_instance_type_list = ["t3.micro"]
postgres_ami             = "ami-db-87654321"
postgres_instance_type   = "t3.small"
mysql_sg_ids             = ["sg-db-11111111", "sg-db-22222222"]
postgres_sg_ids          = ["sg-db-33333333"]

# Web Server Variables
web_instance_count = 1
web_ami_list       = ["ami-web-12345678", "ami-web-87654321"]
web_instance_types = ["t3.micro"]
web_instance_names = ["myproject-web-1"]
web_sg_ids         = [
  ["sg-web-11111111", "sg-web-22222222"]
]

# Public Server Variables
public_instance_count = 2
public_ami_list       = ["ami-public-12345678", "ami-public-87654321"]
public_instance_types = ["t3.micro", "t3.small"]
public_instance_names = ["myproject-public-1", "myproject-public-2"]
public_sg_ids         = [
  ["sg-public-11111111"],
  ["sg-public-22222222", "sg-public-33333333"]
]

# ALB Variables
alb_target_port       = 80
alb_target_protocol   = "HTTP"
alb_listener_port     = 80
alb_listener_protocol = "HTTP"
alb_health_check_path = "/"

# EFS Variables
efs_creation_token = "my-efs-token"

# RDS Variables
mysql_engine_version    = "8.0"
mysql_instance_class    = "db.t3.micro"
mysql_allocated_storage = 20
mysql_storage_type      = "gp2"
mysql_username          = "admin"
mysql_password          = "changeme123"

# Backup Variables
backup_schedule       = "cron(0 5 * * ? *)"
backup_retention_days = 7
backup_role_arn       = "arn:aws:iam::123456789012:role/AWSBackupDefaultServiceRole"

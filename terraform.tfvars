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

app_instance_count = 2
app_ami            = "ami-0abcdef1234567890"
app_instance_type  = "t3.micro"

mysql_ami           = "ami-0abcdef1234567890"
mysql_instance_type = "t3.micro"
postgres_ami        = "ami-0abcdef1234567890"
postgres_instance_type = "t3.micro"

web_instance_count = 1
web_ami            = "ami-0abcdef1234567890"
web_instance_type  = "t3.micro"

public_instance_count = 2
public_ami            = "ami-0abcdef1234567890"
public_instance_type  = "t3.micro"

alb_target_port       = 80
alb_target_protocol   = "HTTP"
alb_listener_port     = 80
alb_listener_protocol = "HTTP"
alb_health_check_path = "/"

efs_creation_token = "my-efs-token"

mysql_engine_version    = "8.0"
mysql_instance_class    = "db.t3.micro"
mysql_allocated_storage = 20
mysql_storage_type      = "gp2"
mysql_username          = "admin"
mysql_password          = "changeme123"

backup_schedule       = "cron(0 5 * * ? *)"
backup_retention_days = 7
backup_role_arn       = "arn:aws:iam::123456789012:role/AWSBackupDefaultServiceRole"

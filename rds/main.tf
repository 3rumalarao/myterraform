resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = merge(var.tags, { Name = "${var.name_prefix}-rds-subnet-group" })
}

resource "aws_db_instance" "mysql" {
  count                   = var.environment == "prod" ? 1 : 0
  identifier              = "${var.name_prefix}-mysql-db"
  engine                  = "mysql"
  engine_version          = var.mysql_engine_version
  instance_class          = var.mysql_instance_class
  allocated_storage       = var.mysql_allocated_storage
  storage_type            = var.mysql_storage_type
  username                = var.mysql_username
  password                = var.mysql_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.db_sg_id]
  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 7
  backup_window           = "05:00-06:00"
  maintenance_window      = "Mon:05:00-Mon:06:00"
  tags = merge(var.tags, {
    Name        = "${var.name_prefix}-mysql-db",
    Environment = var.environment
  })
  lifecycle {
    ignore_changes = [password]
  }
}

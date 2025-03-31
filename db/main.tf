resource "aws_instance" "mysql" {
  ami           = var.mysql_ami
  instance_type = element(var.mysql_instance_type_list, 0)
  subnet_id     = element(var.private_subnet_ids, 0)
  vpc_security_group_ids = var.mysql_sg_ids
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-mysql",
    Role = "db-mysql"
  })
}

resource "aws_instance" "postgresql" {
  ami           = var.postgres_ami
  instance_type = var.postgres_instance_type
  subnet_id     = element(var.private_subnet_ids, 1)
  vpc_security_group_ids = var.postgres_sg_ids
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-postgresql",
    Role = "db-postgresql"
  })
}

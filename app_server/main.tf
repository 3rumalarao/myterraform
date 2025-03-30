resource "aws_instance" "app_server" {
  count                 = var.app_instance_count
  ami                   = var.app_ami
  instance_type         = var.app_instance_type
  subnet_id             = element(var.private_subnet_ids, count.index % length(var.private_subnet_ids))
  vpc_security_group_ids = [var.app_sg_id]
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-app-${count.index + 1}",
    Role = "app"
  })
}

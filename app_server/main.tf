resource "aws_instance" "app_server" {
  count         = var.app_instance_count
  ami           = element(var.app_ami_list, count.index % length(var.app_ami_list))
  instance_type = element(var.app_instance_types, count.index % length(var.app_instance_types))
  subnet_id     = element(var.private_subnet_ids, count.index % length(var.private_subnet_ids))
  vpc_security_group_ids = element(var.app_sg_ids, count.index % length(var.app_sg_ids))
  tags = merge(var.tags, {
    Name = element(var.app_instance_names, count.index),
    Role = "app"
  })
}

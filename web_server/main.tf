resource "aws_instance" "web_server" {
  count         = var.web_instance_count
  ami           = element(var.web_ami_list, count.index % length(var.web_ami_list))
  instance_type = element(var.web_instance_types, count.index % length(var.web_instance_types))
  subnet_id     = element(var.private_subnet_ids, count.index % length(var.private_subnet_ids))
  vpc_security_group_ids = element(var.web_sg_ids, count.index % length(var.web_sg_ids))
  tags = merge(var.tags, {
    Name = element(var.web_instance_names, count.index),
    Role = "web"
  })
}

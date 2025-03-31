resource "aws_instance" "public_server" {
  count         = var.public_instance_count
  ami           = element(var.public_ami_list, count.index % length(var.public_ami_list))
  instance_type = element(var.public_instance_types, count.index % length(var.public_instance_types))
  subnet_id     = element(var.public_subnet_ids, count.index % length(var.public_subnet_ids))
  vpc_security_group_ids = element(var.public_sg_ids, count.index % length(var.public_sg_ids))
  tags = merge(var.tags, {
    Name = element(var.public_instance_names, count.index),
    Role = "public"
  })
}

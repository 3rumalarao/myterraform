resource "aws_instance" "public_server" {
  count                 = var.public_instance_count
  ami                   = var.public_ami
  instance_type         = var.public_instance_type
  subnet_id             = element(var.public_subnet_ids, count.index % length(var.public_subnet_ids))
  vpc_security_group_ids = [var.public_sg_id]
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-public-${count.index + 1}",
    Role = "public"
  })
}

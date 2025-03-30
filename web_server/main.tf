resource "aws_instance" "web_server" {
  count                 = var.web_instance_count
  ami                   = var.web_ami
  instance_type         = var.web_instance_type
  subnet_id             = element(var.private_subnet_ids, count.index % length(var.private_subnet_ids))
  vpc_security_group_ids = [var.web_sg_id]
  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-${count.index + 1}",
    Role = "web"
  })
}

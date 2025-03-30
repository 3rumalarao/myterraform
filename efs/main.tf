resource "aws_efs_file_system" "this" {
  creation_token = var.creation_token
  tags           = merge(var.tags, { Name = "${var.name_prefix}-efs" })
}

resource "aws_efs_mount_target" "this" {
  count           = length(var.private_subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = element(var.private_subnet_ids, count.index)
  security_groups = [var.efs_sg_id]
}
